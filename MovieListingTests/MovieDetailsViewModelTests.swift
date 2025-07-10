//
//  MovieDetailsViewModelTests.swift
//  MovieListingTests
//
//  Created by NATHIYA on 10/07/25.
//

import XCTest

@MainActor
final class MovieDetailsViewModelTests: XCTestCase {

    var viewModel : MovieDetailsViewModel?
    
    override func setUpWithError() throws {
        viewModel = MovieDetailsViewModel(apiService: MockSuccessApiService())
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testfetchMovieDetails() async {
        
        await viewModel?.fetchMovieDetail(imdbID: testMovieId)
        
        XCTAssertEqual(viewModel?.movieDetail?.primaryTitle, "Interstellar")
        XCTAssertEqual(viewModel?.movieDetail?.releaseDate, "2014-11-07")
        XCTAssertEqual(viewModel?.movieDetail?.productionCompanies?.count, 3)
        XCTAssertNotNil(viewModel?.movieDetail)
        XCTAssertNil(viewModel?.errorMessage)
        XCTAssert(viewModel?.isLoading == false)
        XCTAssertEqual(viewModel?.movieTitle, "Interstellar")
        XCTAssertEqual(viewModel?.movieRating, "8.7")
        XCTAssertEqual(viewModel?.movieDuration, "02 hr : 49 min")
        XCTAssertEqual(viewModel?.movieGenres, "Adventure, Drama, Sci-Fi")
        XCTAssertEqual(viewModel?.movieDirectors, "Christopher Nolan")
        XCTAssertEqual(viewModel?.movieCast.count, 21)
        XCTAssert(viewModel?.isLoading == false)
        XCTAssertNil(viewModel?.errorMessage)
    }
    
    func testFetchMovieDetailsFail() async  {
        let viewModel =  MovieDetailsViewModel(apiService: MockFailureAPIService())
        await viewModel.fetchMovieDetail(imdbID: testMovieId, )
        
        XCTAssertNil(viewModel.movieDetail)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    

}
