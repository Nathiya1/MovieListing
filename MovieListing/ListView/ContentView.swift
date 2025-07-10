//
//  ContentView.swift
//  MovieListing
//
//  Created by NATHIYA on 08/04/25.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = MovieViewModel(apiService: MovieApiService())

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea() // Full-screen black background

                Group {
                    if viewModel.isLoading {
                        LoadingView()
                    } else if let error = viewModel.errorMessage {
                        ErrorView(message: error, retryAction: {
                            Task { await viewModel.fetchMovie() }
                        })
                    } else {
                        MovieListView(movies: viewModel.movies)
                    }
                }
            }
            .navigationTitle("Top 250 Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            Task {
                await viewModel.fetchMovie()
            }
        }
    }
}

#Preview {
    ContentView()
}
