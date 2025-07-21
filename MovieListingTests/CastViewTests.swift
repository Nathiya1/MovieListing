import XCTest
import SwiftUI
import ViewInspector
@testable import MovieListing

final class CastCardTests: XCTestCase {
    
    func testCastCardRendersCorrectly() throws {
        let mockCast = Cast(id: "nm0000190", url: "https://www.imdb.com/name/nm0000190/", fullName: "Matthew McConaughey", job: "actor", characters: ["Cooper"])

        let view = CastView(cast: mockCast)
        ViewHosting.host(view: view)

        let vStack = try view.inspect().vStack()

        let text1 = try vStack.text(1).string()
        XCTAssertEqual(text1, "Matthew McConaughey")

        let text2 = try vStack.text(2).string()
        XCTAssertEqual(text2, "Cooper")
    }

}
