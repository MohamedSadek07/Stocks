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
                HTTPHeaderField.apiHost.rawValue: "yh-finance.p.rapidapi.com",
                HTTPHeaderField.apiKey.rawValue: "f6302732c9msh50913f736f96c1ep143fe4jsnf7726c6abe7a",
            ]
            return headers
    }
}
