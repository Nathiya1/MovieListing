import Foundation

class MockSuccessApiService: MovieServiceProtocol {
    
    func fetchMovies() async throws -> [Movie] {
        return JSONLoader.load(LocalJsonFile.list.rawValue, type: [Movie].self)
    }
    
    func fetchMovieDetails(id: String) async throws -> Movie? {
        if id == testMovieId {
            return JSONLoader.load(LocalJsonFile.details.rawValue, type: Movie.self)
        }
        else {
            return nil
        }
    }
}


