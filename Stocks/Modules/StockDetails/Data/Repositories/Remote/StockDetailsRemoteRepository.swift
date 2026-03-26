//
//  StockDetailsRemoteRepository.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import Foundation
import Combine

class StockDetailsRemoteRepository: StockDetailstRemoteRepositoryProtocol {
    private let networkClient = NetworkClient(configuration: URLSession.shared.configuration, session: .shared)

    func getStockDetails(request: StockDetailsRequestModel) -> AnyPublisher<StockDetailsResponseModel, NetworkError> {
        networkClient.request(request: StockDetailsEndpointProvider.details(request).makeRequest, mapToModel: StockDetailsResponseModel.self)
    }
}
