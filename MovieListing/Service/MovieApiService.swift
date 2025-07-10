//
//  MovieApiService.swift
//  MovieListing
//
//  Created by NATHIYA on 08/04/25.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies() async throws -> [Movie]
    func fetchMovieDetails(id: String) async throws -> Movie?
}

class MovieApiService : MovieServiceProtocol {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
            self.session = session
    }
    
    // Fetch list of top 250 movies
    func fetchMovies() async throws -> [Movie] {
        let request = ApiRequest(path: ApiPath.listApi.rawValue)
        
        guard let urlRequest = request.asURLRequest() else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([Movie].self, from: data)
    }
    
    //Fetch movie detail with id
    func fetchMovieDetails(id: String) async throws -> Movie? {
        let request = ApiRequest(path: ApiPath.detailsApi.rawValue + id)//+ id
        guard let urlRequest = request.asURLRequest() else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let movie = try JSONDecoder().decode(Movie.self, from: data)
        return movie
    }
}

