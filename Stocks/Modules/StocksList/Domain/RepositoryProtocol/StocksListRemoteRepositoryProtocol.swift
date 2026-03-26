//
//  StocksListRemoteRepositoryProtocol.swift
//  Stocks
//
//  Created by Mohamed Sadek on 25/03/2026.
//

import Foundation
import Combine

 protocol StocksListRemoteRepositoryProtocol {
     func getStocks(request: MarketSummaryRequestModel) -> AnyPublisher<MarketSummaryResponseModel, NetworkError>
}
