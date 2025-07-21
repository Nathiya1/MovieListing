import Foundation

class MockMovieDetailsViewModel: MovieDetailsViewModel {
    override var movieThumbnailURL: URL? { URL(string: "https://example.com/thumbnail.jpg") }
    override var movieImageUrl: URL? { URL(string: "https://example.com/image.jpg") }
    override var movieTitle: String { "Sample Movie" }
    override var movieDirectors: String { "Director One" }
    override var movieDuration: String { "120 min" }
    override var movieGenres: String { "Drama, Action" }
    override var movieRating: String { "4.5" }
    override var movieSummary: String { "A thrilling tale of adventure." }
    override var movieCast: [Cast] { [Cast(id: "nm0000190",
                                           url: "https://www.imdb.com/name/nm0000190/",
                                           fullName: "Matthew McConaughey",
                                           job: "actor",
                                           characters: ["Cooper"]),
                                           Cast(id: "nm00004421",
                                            url: "https://www.imdb.com/name/nm00004421/",
                                            fullName: "Anny Hathaway",
                                            job: "actress",
                                            characters: ["Brand"])]}
    override init(apiService: MovieServiceProtocol = MockSuccessApiService()) {
        super.init(apiService: apiService)
    }
}
