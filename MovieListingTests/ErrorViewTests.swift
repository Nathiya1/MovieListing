import XCTest
import SwiftUI
import ViewInspector
@testable import MovieListing

final class ErrorViewTests: XCTestCase {
    func testErrorAlertShowsCorrectly() throws {
           let exp = XCTestExpectation(description: "Alert displayed")
           let view = ErrorView(message: "Something went wrong", retryAction: {}, isJailBreak: false)

           ViewHosting.host(view: view)
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
               do {
                   let alert = try view.inspect().find(ViewType.Alert.self)
                   let title = try alert.title().string()
                   XCTAssertEqual(title, ConstantsStrings.error.rawValue)
                   exp.fulfill()
               } catch {
                   XCTFail("Alert not found: \(error)")
               }
           }

           wait(for: [exp], timeout: 1.0)
       }

       func testJailBreakAlertShowsCorrectly() throws {
           let exp = XCTestExpectation(description: "Jailbreak alert displayed")
           let view = ErrorView(message: "Root access detected", retryAction: {}, isJailBreak: true)

           ViewHosting.host(view: view)
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
               do {
                   let alert = try view.inspect().find(ViewType.Alert.self)
                   let title = try alert.title().string()
                   XCTAssertEqual(title, ConstantsStrings.jailbreakDetected.rawValue)
                   exp.fulfill()
               } catch {
                   XCTFail("Jailbreak alert not found: \(error)")
               }
           }

           wait(for: [exp], timeout: 1.0)
       }
}
