//
//  MockFailureApiService.swift
//  MovieListing
//
//  Created by NATHIYA on 10/07/25.
//

import Foundation

class MockFailureAPIService: MovieServiceProtocol {
    func fetchMovieDetails(id: String) async throws -> Movie? {
        throw URLError(.badServerResponse)
    }
    
    func fetchMovies() async throws -> [Movie] {
        throw URLError(.badServerResponse)
    }
}
