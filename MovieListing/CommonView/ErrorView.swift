//
//  ErrorView.swift
//  MovieListing
//
//  Created by NATHIYA on 10/07/25.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            Text("Error: \(message)")
                .foregroundStyle(.white)
            Button("Retry", action: retryAction)
        }
        .padding()
    }
}
