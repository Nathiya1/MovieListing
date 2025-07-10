//
//  MovieDetailView.swift
//  MovieListing
//
//  Created by NATHIYA on 08/04/25.
//

import SwiftUI
import AVKit

struct MovieDetailView: View {
    var id: String
    
    @StateObject var viewModel = MovieDetailsViewModel(apiService: MovieApiService())

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Group {
                if viewModel.isLoading {
                    LoadingView()
                } else if let error = viewModel.errorMessage {
                    ErrorView(message: error) {
                        Task { await viewModel.fetchMovieDetail(imdbID: id) }
                    }
                } else {
                    DetailView(viewModel: viewModel)
                }
            }
        }
        .navigationTitle(viewModel.movieTitle)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchMovieDetail(imdbID: id)
        }
    }
}

#Preview {
    MovieDetailView(id: "tt0111161")
}


