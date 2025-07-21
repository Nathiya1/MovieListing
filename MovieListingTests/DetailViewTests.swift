import XCTest
import SwiftUI
import ViewInspector
@testable import MovieListing

final class DetailViewTests: XCTestCase {

    func testDetailViewDisplaysTitleAndSummary() throws {
        let viewModel = MockMovieDetailsViewModel()
        let view = DetailView(viewModel: viewModel)

        let titleText = try view.inspect().find(ViewType.Text.self, where: { try $0.string() == "Sample Movie" })
        XCTAssertEqual(try titleText.string(), "Sample Movie")

        let summaryText = try view.inspect().find(ViewType.Text.self, where: { try $0.string().contains("thrilling tale") })
        XCTAssertTrue(try summaryText.string().contains("thrilling tale"))
    }

    func testCastSectionContainsCorrectActors() throws {
        let viewModel = MockMovieDetailsViewModel()
        let view = DetailView(viewModel: viewModel)

        let castViews = try view.inspect().findAll(ViewType.View<CastView>.self)
        XCTAssertEqual(castViews.count, 2)
    }
}
