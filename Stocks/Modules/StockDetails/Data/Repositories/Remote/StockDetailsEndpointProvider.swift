//
//  StockDetailsEndpointProvider.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import Foundation

enum StockDetailsEndpointProvider {
    case details(StockDetailsRequestModel)
}

extension StockDetailsEndpointProvider: NetworkRequest {
    var baseURL: String {
        return Constants.baseURL
    }
    var endPoint: String {
        switch self {
        case .details:
            return EndPoint.stockDetails
        }
    }
    var headers: [String: String]? {
        NetworkHelper.getHeaders()
    }
    var queryParams: [String: Any]? {
        switch self {
        case let .details(params):
            return params.asDictionary
        }
    }
    var parameters: [String: Any]? {
        nil
    }
    var method: APIHTTPMethod {
        switch self {
        case .details:
            return .GET
        }
    }
}
