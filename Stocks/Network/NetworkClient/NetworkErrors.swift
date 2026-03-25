//
//  NetworkErrors.swift
//  Stocks
//
//  Created by Mohamed Sadek on 25/03/2026.
//

enum NetworkError: Error {
    case normalError(Error)
    case notValidURL
    case unAuthorithed
    case requestFailed
    case emptyErrorWithStatusCode(String)
    case decodeFailed
}
