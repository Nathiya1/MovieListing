import XCTest

@MainActor
final class MovieViewModelTests: XCTestCase {
   
    func testFectchMovies() async  {
        let viewModel =  MovieViewModel(apiService: MockSuccessApiService())
        await viewModel.fetchMovie()
        if NetworkMonitor.shared.isConnected {
            XCTAssertEqual(viewModel.movies.count, 250)
            XCTAssertEqual(viewModel.movies.first?.primaryTitle, "The Shawshank Redemption")
            XCTAssertNil(viewModel.errorMessage)
            XCTAssertFalse(viewModel.isLoading)
        }
        else {
            XCTAssertEqual(viewModel.errorMessage, ConstantsStrings.noInternetConnection.rawValue)
            XCTAssertEqual(viewModel.movies.count, 0)
        }
        
        
    }
    
    func testFetchMoviesFail() async  {
        let viewModel =  MovieViewModel(apiService: MockFailureAPIService())
        await viewModel.fetchMovie()
        
        XCTAssertEqual(viewModel.movies.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func testFecthMovieErrorMessageNoInternet() async  {
        NetworkMonitor.shared.isConnected = false
        let viewModel =  MovieViewModel(apiService: MockFailureAPIService())
        await viewModel.fetchMovie()
        
        XCTAssertEqual(viewModel.errorMessage, ConstantsStrings.noInternetConnection.rawValue)
    }
    
    func testFecthMovieErrorMessageBadResponse() async  {
        if NetworkMonitor.shared.isConnected {
            let viewModel =  MovieViewModel(apiService: MockFailureAPIService())
            await viewModel.fetchMovie()
            
            XCTAssertEqual(viewModel.errorMessage, URLError(.badServerResponse).localizedDescription)
        }
    }
}
