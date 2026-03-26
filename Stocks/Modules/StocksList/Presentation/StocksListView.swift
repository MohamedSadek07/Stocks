//
//  StocksListView.swift
//  Stocks
//
//  Created by Mohamed Sadek on 25/03/2026.
//

import SwiftUI

struct StocksListView: View {
    @StateObject var viewModel: StocksListViewModel
    // MARK: - Init
    init(viewModel: StocksListViewModel) {
         _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            Text("Hello World")
        }
        .onAppear {
            viewModel.getMarketSummary()
        }
    }

}

#Preview {
    StocksListConfigurator.configureModule()
}
