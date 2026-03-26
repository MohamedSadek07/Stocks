//
//  StockDetailsView.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import SwiftUI


struct StockDetailsView: View {
    // MARK: Dependencies
    @StateObject var viewModel: StockDetailsViewModel
    // MARK: - Init
    init(viewModel: StockDetailsViewModel) {
         _viewModel = StateObject(wrappedValue: viewModel)
    }
    // MARK: - Body
    var body: some View {
        VStack {
            profileContent()
        }
        .navigationTitle(viewModel.sentTicker)
        .navigationBarTitleDisplayMode(.automatic)
        .onAppear { viewModel.callGetStockDetails() }
        .overlay(alignment: .center) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
    }
}

// MARK: - Components Extension
extension StockDetailsView {
    @ViewBuilder
    private func profileContent() -> some View {
        List {
            Section("Location") {
                InfoRow(label: "Country", value: viewModel.stockDetails?.body.country)
                InfoRow(label: "City",    value: viewModel.stockDetails?.body.city)
            }

            Section("Contact") {
                InfoRow(label: "Phone", value: viewModel.stockDetails?.body.phone)
                if let website = viewModel.stockDetails?.body.website, let url = URL(string: website) {
                    LabeledContent("Website") {
                        Link(website, destination: url)
                            .font(.subheadline)
                    }
                }
            }

            Section("Company") {
                InfoRow(label: "Industry", value: viewModel.stockDetails?.body.industry)
                InfoRow(label: "Sector",   value: viewModel.stockDetails?.body.sector)
            }
        }
        .listStyle(.plain)
    }
}
