import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieViewModel(apiService: MovieApiService())

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()

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
            .navigationTitle(ConstantsStrings.headerTitle.rawValue)
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
