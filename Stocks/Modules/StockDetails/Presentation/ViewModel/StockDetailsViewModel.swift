//
//  StockDetailsViewModel.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import Foundation
import Combine

class StockDetailsViewModel: ObservableObject {

    // Variables
    private let stockDetailsUseCase: StockDetailsUseCaseProtocol
    private var cancelable: Set<AnyCancellable> = []
    var sentTicker = ""
    // Published Variables
    @Published var isLoading = false
    @Published var stockDetails: StockDetailsResponseModel?

    // MARK: - init
    init(stockDetailsUseCase: StockDetailsUseCaseProtocol, ticker: String) {
        self.stockDetailsUseCase = stockDetailsUseCase
        self.sentTicker = ticker
    }
    // MARK: - Methods
    private func getStockDetails() {
        isLoading = true
        stockDetailsUseCase.getStockDetails(
            request: StockDetailsRequestModel(
                ticker: sentTicker,
                module: "asset-profile"
            )
        ).sink(receiveCompletion: { [weak self] completion in
                guard let self = self else {return}
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    Log.error("get Stock Details Error \(err)")
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else {return}
                stockDetails = response
            }).store(in: &cancelable)
    }
    func callGetStockDetails() {
        getStockDetails()
    }
}
