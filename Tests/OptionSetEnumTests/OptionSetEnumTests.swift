import XCTest
@testable import OptionSetEnum

final class OptionSetEnumTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(OptionSetEnum().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
