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
    let price: Double
    let changePercent: Double

    var isPositive: Bool { changePercent >= 0 }
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
                .foregroundColor(.primary)
 
            Spacer()
 
            VStack(alignment: .trailing, spacing: 2) {
                Text(String(format: "$%.2f", stock.price))
                    .font(.subheadline.monospacedDigit())
                    .foregroundColor(.primary)
 
                Text(String(format: "%@%.2f%%",
                            stock.isPositive ? "+" : "", stock.changePercent))
                    .font(.caption.monospacedDigit())
                    .foregroundColor(stock.isPositive ? .green : .red )
            }
        }
        .padding(.vertical, 4)
    }
}
