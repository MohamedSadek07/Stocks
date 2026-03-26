//
//  StocksListUseCase.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import Combine

protocol StocksListUseCaseProtocol: AnyObject {
    func getStocks(request: MarketSummaryRequestModel) -> AnyPublisher<MarketSummaryResponseModel, NetworkError>
}

class StocksListUseCase: StocksListUseCaseProtocol {
    private let stocksListRemoteRepository: StocksListRemoteRepositoryProtocol
    /// Initialize the interactor with the required parameters to work properly
    init(stocksListRemoteRepository: StocksListRemoteRepositoryProtocol) {
        self.stocksListRemoteRepository = stocksListRemoteRepository
    }

    func getStocks(request: MarketSummaryRequestModel) -> AnyPublisher<MarketSummaryResponseModel, NetworkError> {
        stocksListRemoteRepository.getStocks(request: request)
    }
}
