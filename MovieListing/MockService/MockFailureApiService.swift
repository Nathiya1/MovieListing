import Foundation

class MockFailureAPIService: MovieServiceProtocol {
    func fetchMovieDetails(id: String) async throws -> Movie? {
        throw URLError(.badServerResponse)
    }
    func fetchMovies() async throws -> [Movie] {
        throw URLError(.badServerResponse)
    }
}
