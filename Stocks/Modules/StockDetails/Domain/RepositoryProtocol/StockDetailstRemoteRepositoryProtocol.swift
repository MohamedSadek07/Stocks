//
//  StockDetailstRemoteRepositoryProtocol.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import Foundation
import Combine

 protocol StockDetailstRemoteRepositoryProtocol {
     func getStockDetails(request: StockDetailsRequestModel) -> AnyPublisher<StockDetailsResponseModel, NetworkError>
}
