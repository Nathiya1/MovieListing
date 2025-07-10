//
//  MovieViewModelTests.swift
//  MovieListingTests
//
//  Created by NATHIYA on 10/07/25.
//

import XCTest

@MainActor
final class MovieViewModelTests: XCTestCase {
   
    func testFectchMovies() async  {
        let viewModel =  MovieViewModel(apiService: MockSuccessApiService())
        await viewModel.fetchMovie()
        
        XCTAssertEqual(viewModel.movies.count, 250)
        XCTAssertEqual(viewModel.movies.first?.primaryTitle, "The Shawshank Redemption")
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
        
    }
    
    func testFetchMoviesFail() async  {
        let viewModel =  MovieViewModel(apiService: MockFailureAPIService())
        await viewModel.fetchMovie()
        
        XCTAssertEqual(viewModel.movies.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    

}
