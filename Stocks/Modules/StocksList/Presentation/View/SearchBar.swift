//
//  SearchBar.swift
//  Stocks
//
//  Created by Mohamed Sadek on 26/03/2026.
//

import SwiftUI

///  Native Seach Bar View
struct SearchBar: View {
    // MARK: Variables
    @Binding var text: String

    // MARK: - Body
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("Search stocks", text: $text)
                .autocorrectionDisabled()
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
