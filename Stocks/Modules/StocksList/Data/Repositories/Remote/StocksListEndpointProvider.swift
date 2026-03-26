//
//  StocksListEndpointProvider.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import Foundation

enum StocksListEndpointProvider {
    case list(MarketSummaryRequestModel)
}

extension StocksListEndpointProvider: NetworkRequest {
    var baseURL: String {
        return Constants.baseURL
    }
    var endPoint: String {
        switch self {
        case .list:
            return EndPoint.stocksList
        }
    }
    var headers: [String: String]? {
        NetworkHelper.getHeaders()
    }
    var queryParams: [String: Any]? {
        switch self {
        case let .list(params):
            return params.asDictionary
        }
    }
    var parameters: [String: Any]? {
        nil
    }
    var method: APIHTTPMethod {
        switch self {
        case .list:
            return .GET
        }
    }
}

