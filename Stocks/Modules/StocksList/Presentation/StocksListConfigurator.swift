//
//  StocksListConfigurator.swift
//  Stocks
//
//  Created by Mohamed Sadek on 25/03/2026.
//

final class StocksListConfigurator {
    static func configureModule() ->  StocksListView {
        let remoteRepo = StocksListRemoteRepository()
        let useCase = StocksListUseCase(stocksListRemoteRepository: remoteRepo)
        let viewModel = StocksListViewModel(stocksListUseCase: useCase)
        let view = StocksListView(viewModel: viewModel)
        return view
    }
}
