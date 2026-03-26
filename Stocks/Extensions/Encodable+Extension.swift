//
//  Encodable+Extension.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//
import Foundation

extension Encodable {
    var asDictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }

        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return [:]
        }
        return dictionary
    }
}
