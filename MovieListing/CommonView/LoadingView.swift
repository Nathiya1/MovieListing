//
//  LoadingView.swift
//  MovieListing
//
//  Created by NATHIYA on 10/07/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
            .foregroundStyle(.white)
    }
}
#Preview {
    LoadingView()
}
