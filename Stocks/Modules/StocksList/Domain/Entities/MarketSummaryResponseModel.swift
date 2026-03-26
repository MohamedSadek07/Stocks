//
//  MarketSummaryResponseModel.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

// MARK: - MarketSummaryResponseModel
struct MarketSummaryResponseModel: Codable {
    let marketSummaryAndSparkResponse: MarketSummaryAndSparkResponse
}

// MARK: - MarketSummaryAndSparkResponse
struct MarketSummaryAndSparkResponse: Codable {
    let result: [Result]
    let error: String?
}

// MARK: - Result
struct Result: Codable {
    let fullExchangeName, symbol: String?
    let gmtOffSetMilliseconds: Int?
    let language: String?
    let quoteType: String?
    let tradeable: Bool?
    let exchangeTimezoneName: String?
    let cryptoTradeable: Bool?
    let firstTradeDateMilliseconds, exchangeDataDelayedBy: Int?
    let exchangeTimezoneShortName: String?
    let hasPrePostMarketData: Bool?
    let marketState: String?
    let customPriceAlertConfidence: String?
    let market: String?
    let priceHint: Int?
    let exchange: String?
    let sourceInterval: Int?
    let shortName: String?
    let region: String?
    let triggerable: Bool?
}
