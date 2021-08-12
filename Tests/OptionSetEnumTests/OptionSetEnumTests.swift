import XCTest
@testable import OptionSetEnum

final class OptionSetEnumTests: XCTestCase {
    enum MagicColor: CaseIterable {
        case white
        case blue
        case black
        case red
        case green
    }
    
    func testNoValue() {
        let test: OptionSetEnum<MagicColor> = []
        
        XCTAssertEqual(test.rawValue, 0)
    }
    
    func testMultiValues() {
        let izzet: OptionSetEnum<MagicColor> = [.blue, .red]
        
        let izzetExpect = 10
        
        XCTAssertEqual(izzet.rawValue, izzetExpect)
    }

    static var allTests = [
        ("testMultiValues", testMultiValues),
    ]
}
