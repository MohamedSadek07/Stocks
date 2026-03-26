//
//  StocksListView.swift
//  Stocks
//
//  Created by Mohamed Sadek on 25/03/2026.
//

import SwiftUI

struct StocksListView: View {
    // MARK: Dependencies
    @StateObject var viewModel: StocksListViewModel
    // MARK: - Init
    init(viewModel: StocksListViewModel) {
         _viewModel = StateObject(wrappedValue: viewModel)
    }
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    Text("Stocks")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                SearchBar(text: $viewModel.searchText)
                ScrollView(showsIndicators: false) {
                    stocksList()
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.callGetMarketSummary()
            viewModel.startAutoUpdate()
        }
        .onDisappear {
            viewModel.stopAutoUpdate()
        }
        .overlay(alignment: .center) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
    }
}

#Preview {
    StocksListConfigurator.configureModule()
}

// MARK: - Components Extension
extension StocksListView {
    private func stocksList() -> some View {
        let filtered = viewModel.searchText.isEmpty
            ? viewModel.stocksArray
            : viewModel.stocksArray.filter {
                ($0.name ?? "").localizedCaseInsensitiveContains(viewModel.searchText)
            }

        return ForEach(filtered, id: \.self) { stockItem in
            NavigationLink(destination: StockDetailsConfigurator.configureModule(ticker: stockItem.symbol ?? "")) {
                StockRow(
                    stock: Stock(
                        name: stockItem.name ?? "",
                        price: stockItem.lastsale ?? "",
                        changePercent: stockItem.netchange ?? ""
                    )
                )
            }
            Divider()
        }
    }
}
