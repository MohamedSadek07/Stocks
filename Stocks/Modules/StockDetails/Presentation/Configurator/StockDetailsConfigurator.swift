//
//  StockDetailsConfigurator.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

final class StockDetailsConfigurator {
    static func configureModule(ticker: String) ->  StockDetailsView {
        let remoteRepo = StockDetailsRemoteRepository()
        let useCase = StockDetailsUseCase(stockDetailstRemoteRepository: remoteRepo)
        let viewModel = StockDetailsViewModel(
            stockDetailsUseCase: useCase,
            ticker: ticker
        )
        let view = StockDetailsView(viewModel: viewModel)
        return view
    }
}


