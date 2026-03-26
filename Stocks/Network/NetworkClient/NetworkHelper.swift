//
//  NetworkHelper.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import Foundation
import Combine

class NetworkHelper {
    enum HTTPHeaderField: String {
        case contentType = "Content-Type"
        case apiHost = "x-rapidapi-host"
        case apiKey = "x-rapidapi-key"
    }
    static func getHeaders() -> [String: String] {
            let headers = [
                HTTPHeaderField.contentType.rawValue: "application/json",
                HTTPHeaderField.apiHost.rawValue: "yahoo-finance15.p.rapidapi.com",
                HTTPHeaderField.apiKey.rawValue: "1b10a00ddbmsh88d3e6e975e113cp1abe99jsn9a62c642845b",
            ]
            return headers
    }
}
