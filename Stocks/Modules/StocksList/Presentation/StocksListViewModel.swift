//
//  StocksListViewModel.swift
//  Stocks
//
//  Created by Mohamed Sadek on 25/03/2026.
//

import Foundation
import Combine

class StocksListViewModel: ObservableObject {

    private let stocksListUseCase: StocksListUseCaseProtocol
    private var cancelable: Set<AnyCancellable> = []
    @Published var isLoading = false

    init(stocksListUseCase: StocksListUseCaseProtocol) {
        self.stocksListUseCase = stocksListUseCase
    }

    func getMarketSummary() {
        isLoading = true
        stocksListUseCase.getStocks(request: MarketSummaryRequestModel(region: "US"))
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else {return}
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    Log.error("getStocks Error \(err)")
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else {return}
                print("response", response)
            }).store(in: &cancelable)
    }
}
