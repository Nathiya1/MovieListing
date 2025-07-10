//
//  MovieViewModel.swift
//  MovieListing
//
//  Created by NATHIYA on 08/04/25.
//

import Foundation
import AVKit

@MainActor
class MovieViewModel : ObservableObject {
    
    @Published var movies : [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage : String? = nil
    
    var apiService : MovieServiceProtocol
    
    init(apiService:MovieServiceProtocol) {
        self.apiService = apiService
    }
    
    // API Call
    
    func fetchMovie() async {
        isLoading = true
         if NetworkMonitor.shared.isConnected {
            errorMessage = nil
            do {
                self.movies = try await apiService.fetchMovies()
                isLoading = false
            } catch {
                isLoading = false
                errorMessage = error.localizedDescription
            }
        }
        else {
            isLoading = false
            errorMessage = "No internet connection"
        }
    }
}
