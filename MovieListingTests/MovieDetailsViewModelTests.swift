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
        if NetworkMonitor.shared.isConnected {
            XCTAssertEqual(viewModel?.movieDetail?.primaryTitle, viewModel?.movieTitle)
            XCTAssertEqual(String(format: "%.1f",viewModel?.movieDetail?.averageRating ?? 0.0), viewModel?.movieRating)
            XCTAssertEqual(viewModel?.movieDetail?.cast?.count, viewModel?.movieCast.count)
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
            XCTAssertEqual(viewModel?.movieSummary,"When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.")
            XCTAssert(((viewModel?.movieImageUrl) != nil),"https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_QL75_UX100_CR0,0,100,148_.jpg")
            XCTAssertNotNil(viewModel?.movieThumbnailURL, "https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_QL75_UX380_CR0,0,380,562_.jpg")
        }
        else {
            XCTAssertEqual(viewModel?.errorMessage, ConstantsStrings.noInternetConnection.rawValue)
        }
       
    }
    
    func testFetchMovieDetailsFail() async  {
        let viewModel =  MovieDetailsViewModel(apiService: MockFailureAPIService())
        await viewModel.fetchMovieDetail(imdbID: testMovieId )
        
        XCTAssertNil(viewModel.movieDetail)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testFetchMovieDetail_whenNetworkFails_setsError() async {
            NetworkMonitor.shared.isConnected = false
            let viewModel =  MovieDetailsViewModel(apiService: MockFailureAPIService())
            await viewModel.fetchMovieDetail(imdbID: "tt123456")
            XCTAssertEqual(viewModel.errorMessage, "No internet connection")
        NetworkMonitor.shared.isConnected = true
        }
    
    func testFetchMovieDetail_BadResponse() async {
        if NetworkMonitor.shared.isConnected {
            let viewModel =  MovieDetailsViewModel(apiService: MockFailureAPIService())
            await viewModel.fetchMovieDetail(imdbID: testMovieId)
        XCTAssertEqual(viewModel.errorMessage, (URLError(.badServerResponse)).localizedDescription)
        }
    }

}
