//
//  StockDetailsResponseModel.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

struct StockDetailsResponseModel: Codable {
    let meta: Meta?
    let body: StockDetails

    init(meta: Meta? = nil,
         body: StockDetails) {
        self.meta = meta
        self.body = body
    }
}

// MARK: - Body
struct StockDetails: Codable {
    let address1, city, state, zip: String?
    let country, phone: String?
    let website: String?
    let industry, industryKey, industryDisp, sector: String?
    let sectorKey, sectorDisp, longBusinessSummary: String?
    let fullTimeEmployees: Int?
    let auditRisk, boardRisk, compensationRisk, shareHolderRightsRisk: Int?
    let overallRisk, governanceEpochDate, compensationAsOfEpochDate: Int?
    let maxAge: Int?

    init(
        address1: String? = nil,
        city: String? = nil,
        state: String? = nil,
        zip: String? = nil,
        country: String? = nil,
        phone: String? = nil,
        website: String? = nil,
        industry: String? = nil,
        industryKey: String? = nil,
        industryDisp: String? = nil,
        sector: String? = nil,
        sectorKey: String? = nil,
        sectorDisp: String? = nil,
        longBusinessSummary: String? = nil,
        fullTimeEmployees: Int? = nil,
        auditRisk: Int? = nil,
        boardRisk: Int? = nil,
        compensationRisk: Int? = nil,
        shareHolderRightsRisk: Int? = nil,
        overallRisk: Int? = nil,
        governanceEpochDate: Int? = nil,
        compensationAsOfEpochDate: Int? = nil,
        maxAge: Int? = nil
    ) {
        self.address1 = address1
        self.city = city
        self.state = state
        self.zip = zip
        self.country = country
        self.phone = phone
        self.website = website
        self.industry = industry
        self.industryKey = industryKey
        self.industryDisp = industryDisp
        self.sector = sector
        self.sectorKey = sectorKey
        self.sectorDisp = sectorDisp
        self.longBusinessSummary = longBusinessSummary
        self.fullTimeEmployees = fullTimeEmployees
        self.auditRisk = auditRisk
        self.boardRisk = boardRisk
        self.compensationRisk = compensationRisk
        self.shareHolderRightsRisk = shareHolderRightsRisk
        self.overallRisk = overallRisk
        self.governanceEpochDate = governanceEpochDate
        self.compensationAsOfEpochDate = compensationAsOfEpochDate
        self.maxAge = maxAge
    }
}
