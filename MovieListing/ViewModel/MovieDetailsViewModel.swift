import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movieDetail: Movie?
    @Published var isLoading = false
    @Published var errorMessage: String?
    var apiService: MovieServiceProtocol
    var movieRating: String {
        return String(format: "%.1f", self.movieDetail?.averageRating ?? 0.0)
    }
    var movieImageUrl: URL? {
        return URL(string: self.movieDetail?.thumbnails?.first?.url ?? "")
    }
    var movieTitle: String {
        return self.movieDetail?.primaryTitle ?? ""
    }
    var movieDuration: String {
        let duration = self.movieDetail?.runtimeMinutes ?? 0
        let hours = duration / 60
        let minutes = duration % 60
        return String(format: "%02d hr : %02d min", hours, minutes)
    }
    var movieGenres: String {
        return self.movieDetail?.genres?.joined(separator: ", ") ?? ""
    }
    var movieSummary: String {
        return self.movieDetail?.description ?? ""
    }
    var movieDirectors: String {
        let directors = self.movieDetail?.directors?.map {$0.fullName}.joined(separator: ", ")
        return directors ?? ""
    }
    var movieCast: [Cast] {
        return self.movieDetail?.cast ?? []
    }
    var movieThumbnailURL: URL? {
        return URL(string: self.movieDetail?.thumbnails?.last?.url ?? "")
    }
    init(apiService: MovieServiceProtocol) {
        self.apiService = apiService
    }
    @MainActor
    func fetchMovieDetail(imdbID: String) async {
        if NetworkMonitor.shared.isConnected {
            isLoading = true
            errorMessage = nil
            do {
                self.movieDetail = try await apiService.fetchMovieDetails(id: imdbID)
                isLoading = false
            } catch {
                errorMessage = error.localizedDescription
                isLoading = false
            }
        } else {
            errorMessage = ConstantsStrings.noInternetConnection.rawValue
            isLoading = false
        }
    }
}
