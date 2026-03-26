//
//  InfoRow.swift
//  Stocks
//
//  Created by Mohamed Sadek on 27/03/2026.
//

import SwiftUI

/// Info Row View
struct InfoRow: View {
    let label: String
    let value: String?
    // MARK: Body
    var body: some View {
        LabeledContent(label) {
            Text(value ?? "")
                .font(.subheadline)
                .foregroundColor(value == nil ? .secondary : .primary)
        }
    }
}
