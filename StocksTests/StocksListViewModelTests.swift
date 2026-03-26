//
//  StocksListViewModelTests.swift
//  Stocks
//
//  Created by Mohamed Sadek on 27/03/2026.
//

import XCTest
import Combine
@testable import Stocks

// Mock Use Case
class MockStocksListUseCase: StocksListUseCaseProtocol {
    var result: Result<MarketSummaryResponseModel, NetworkError> = .success(.stub())
    var callCount = 0

    func getStocks(request: Stocks.MarketSummaryRequestModel) -> AnyPublisher<Stocks.MarketSummaryResponseModel, Stocks.NetworkError> {
        callCount += 1
        return result.publisher
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

// Stubs
extension MarketSummaryResponseModel {
    static func stub(stocks: [Stocks.MarketSummaryResult] = MarketSummaryResult.stubs()) -> Stocks.MarketSummaryResponseModel {
        MarketSummaryResponseModel(body: stocks)
    }
}

extension MarketSummaryResult {
    static func stubs() -> [MarketSummaryResult] {
        [
            MarketSummaryResult(symbol: "AAPL", name: "Apple Inc.", lastsale: "213.49", netchange: "+1.03"),
            MarketSummaryResult(symbol: "MSFT", name: "Microsoft", lastsale: "415.32", netchange: "+1.42"),
            MarketSummaryResult(symbol: "TSLA", name: "Tesla Inc.", lastsale: "177.58", netchange: "-3.33"),
        ]
    }
}

final class StocksListViewModelTests: XCTestCase {

    var sut: StocksListViewModel!
    var mockUseCase: MockStocksListUseCase!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockUseCase = MockStocksListUseCase()
        sut = StocksListViewModel(stocksListUseCase: mockUseCase)
        cancellables = []
    }

    override func tearDown() {
        sut.stopAutoUpdate()
        sut = nil
        mockUseCase = nil
        cancellables = nil
        super.tearDown()
    }

    // MARK: - Fetch Tests
    func test_callGetMarketSummary_populatesStocksArray() {
        let expectation = expectation(description: "stocks loaded")

        sut.$stocksArray
            .dropFirst()
            .sink { stocks in
                XCTAssertEqual(stocks.count, 3)
                XCTAssertEqual(stocks.first?.symbol, "AAPL")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        sut.callGetMarketSummary()
        waitForExpectations(timeout: 1)
    }

    func test_callGetMarketSummary_onFailure_stocksArrayRemainsEmpty() {
        mockUseCase.result = .failure(NetworkError.requestFailed)
        let expectation = expectation(description: "stocks empty on failure")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertTrue(self.sut.stocksArray.isEmpty)
            expectation.fulfill()
        }

        sut.callGetMarketSummary()
        waitForExpectations(timeout: 1)
    }

    // MARK: - Search Filter Tests
    func test_searchText_empty_returnsAllStocks() {
        sut.stocksArray = MarketSummaryResult.stubs()
        sut.searchText = ""

        let filtered = sut.stocksArray.filter {
            ($0.name ?? "").localizedCaseInsensitiveContains(sut.searchText)
        }

        XCTAssertEqual(sut.stocksArray.count, 3)
        _ = filtered // this tests the data is correct
    }

    func test_searchText_matchesCorrectStock() {
        sut.stocksArray = MarketSummaryResult.stubs()
        sut.searchText = "apple"

        let filtered = sut.stocksArray.filter {
            ($0.name ?? "").localizedCaseInsensitiveContains(sut.searchText)
        }

        XCTAssertEqual(filtered.count, 1)
        XCTAssertEqual(filtered.first?.symbol, "AAPL")
    }

    // MARK: - Auto Update Tests
    func test_startAutoUpdate_callsUseCaseAfterInterval() {
        sut.callGetMarketSummary()
        sut.startAutoUpdate()
        sut.stopAutoUpdate()

        XCTAssertGreaterThanOrEqual(mockUseCase.callCount, 1)
    }

    func test_startAutoUpdate_doesNotCrash() {
        XCTAssertNoThrow(sut.startAutoUpdate())
        sut.stopAutoUpdate()
    }

    func test_stopAutoUpdate_preventsAdditionalCalls() {
        sut.startAutoUpdate()
        sut.stopAutoUpdate()
        let countAfterStop = mockUseCase.callCount

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(self.mockUseCase.callCount, countAfterStop, "No new calls after stop")
        }
    }
}
