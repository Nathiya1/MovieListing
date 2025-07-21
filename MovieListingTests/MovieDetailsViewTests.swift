import XCTest
import SwiftUI
import ViewInspector
@testable import MovieListing

final class MovieDetailViewTests: XCTestCase {

    func testDetailViewRendersWhenNotLoadingOrError() throws {
        let mockViewModel = MockMovieDetailsViewModel()
        let view = MovieDetailView(id: "tt123456", viewModel: mockViewModel)

        let detailView = try view.inspect().find(DetailView.self)
        let title = try detailView.find(text: "Sample Movie").string()
        XCTAssertEqual(title, "Sample Movie")
    }

    func testErrorViewRendersOnError() throws {
        let mockViewModel = MockMovieDetailsViewModel()
        mockViewModel.errorMessage = "Something went wrong"

        let view = MovieDetailView(id: "tt123456", viewModel: mockViewModel)

        let errorView = try view.inspect().find(ErrorView.self)
        let message = try errorView.find(text: "Something went wrong").string()
        XCTAssertEqual(message, "Something went wrong")
    }

    func testLoadingViewRendersWhenLoading() throws {
        let mockViewModel = MockMovieDetailsViewModel()
        mockViewModel.isLoading = true

        let view = MovieDetailView(id: "tt123456", viewModel: mockViewModel)

        let loadingView = try view.inspect().find(LoadingView.self)
        XCTAssertNoThrow(loadingView)
    }
}
