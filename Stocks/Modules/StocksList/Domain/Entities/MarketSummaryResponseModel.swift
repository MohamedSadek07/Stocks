//
//  MarketSummaryResponseModel.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

// MARK: - MarketSummaryResponseModel
struct MarketSummaryResponseModel: Codable {
    let meta: Meta?
    let body: [MarketSummaryResult]

    init(meta: Meta? = nil,
         body: [MarketSummaryResult]) {
        self.meta = meta
        self.body = body
    }
}

// MARK: - Body
struct MarketSummaryResult: Codable, Hashable {
    let symbol, name, lastsale, netchange: String?
    let pctchange, marketCap: String?

    init(
        symbol: String? = nil,
        name: String? = nil,
        lastsale: String?  = nil,
        netchange: String? = nil,
        pctchange: String? = nil,
        marketCap: String?  = nil
    ) {
        self.symbol = symbol
        self.name = name
        self.lastsale = lastsale
        self.netchange = netchange
        self.pctchange = pctchange
        self.marketCap = marketCap
    }
}

// MARK: - Meta
struct Meta: Codable {
    let version: String?
    let status: Int?
    let copywrite: String?
    let totalrecords: Int?
    let headers: MarketSummaryResult?
}
