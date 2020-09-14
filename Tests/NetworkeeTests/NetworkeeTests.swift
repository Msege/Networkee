import XCTest
@testable import Networkee

final class NetworkeeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Networkee().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
