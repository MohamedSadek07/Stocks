//
//  StocksListViewModel.swift
//  Stocks
//
//  Created by Mohamed Sadek on 25/03/2026.
//

import Foundation
import Combine

class StocksListViewModel: ObservableObject {

    // Variables
    private let stocksListUseCase: StocksListUseCaseProtocol
    private var cancelable: Set<AnyCancellable> = []
    private var timerCancellable: AnyCancellable?
    // Published Variables
    @Published var isLoading = false
    @Published var stocksArray: [MarketSummaryResult] = []
    @Published var searchText = ""

    // MARK: - init
    init(stocksListUseCase: StocksListUseCaseProtocol) {
        self.stocksListUseCase = stocksListUseCase
    }
    // MARK: - Methods
    private func getMarketSummary() {
        guard !isLoading else { return }
        isLoading = true
        stocksListUseCase.getStocks(request: MarketSummaryRequestModel(page: 1, type: "STOCKS"))
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else {return}
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    Log.error("getStocks Error \(err)")
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else {return}
                stocksArray = response.body
            }).store(in: &cancelable)
    }
    func callGetMarketSummary() {
        getMarketSummary()
    }
    func startAutoUpdate() {
        timerCancellable = Timer.publish(every: 8, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.getMarketSummary()
            }
    }
    func stopAutoUpdate() {
        timerCancellable?.cancel()
    }
}
