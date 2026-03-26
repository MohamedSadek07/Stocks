//
//  StocksListRemoteRepository.swift
//  Stocks
//
//  Created by Mohamed Sadek on 25/03/2026.
//

import Foundation
import Combine

class StocksListRemoteRepository: StocksListRemoteRepositoryProtocol {
    private let networkClient = NetworkClient(configuration: URLSession.shared.configuration, session: .shared)

    func getStocks(request: MarketSummaryRequestModel) -> AnyPublisher<MarketSummaryResponseModel, NetworkError> {
        networkClient.request(request: StocksListEndpointProvider.list(request).makeRequest, mapToModel: MarketSummaryResponseModel.self)
    }
}
