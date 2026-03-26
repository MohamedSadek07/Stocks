//
//  StockRow.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import SwiftUI

/// Stock Model
struct Stock: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let changePercent: String
}

/// Stock Row View
struct StockRow: View {
    // MARK: Variables
    let stock: Stock

    // MARK: - Body
    var body: some View {
        HStack {
            Text(stock.name)
                .font(.headline)
                .foregroundStyle(.black)
                .multilineTextAlignment(.leading)

            Spacer()
 
            VStack(alignment: .trailing, spacing: 2) {
                Text(stock.price)
                    .font(.subheadline.monospacedDigit())
                    .foregroundStyle(.primary)

                Text(stock.changePercent)
                    .font(.caption.monospacedDigit())
                    .foregroundStyle(.green)
            }
        }
        .padding(.vertical, 4)
    }
}
