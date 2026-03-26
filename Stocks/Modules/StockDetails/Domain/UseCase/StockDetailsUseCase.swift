//
//  StockDetailsUseCase.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import Combine

protocol StockDetailsUseCaseProtocol: AnyObject {
    func getStockDetails(request: StockDetailsRequestModel) -> AnyPublisher<StockDetailsResponseModel, NetworkError>
}

class StockDetailsUseCase: StockDetailsUseCaseProtocol {
    private let stockDetailstRemoteRepository: StockDetailstRemoteRepositoryProtocol
    /// Initialize the interactor with the required parameters to work properly
    init(stockDetailstRemoteRepository: StockDetailstRemoteRepositoryProtocol) {
        self.stockDetailstRemoteRepository = stockDetailstRemoteRepository
    }

    func getStockDetails(request: StockDetailsRequestModel) -> AnyPublisher<StockDetailsResponseModel, NetworkError> {
        stockDetailstRemoteRepository.getStockDetails(request: request)
    }
}
