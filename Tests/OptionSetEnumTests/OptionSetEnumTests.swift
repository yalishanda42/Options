import XCTest
@testable import OptionSetEnum

final class OptionSetEnumTests: XCTestCase {
    private enum MagicColor: CaseIterable {
        case white
        case blue
        case black
        case red
        case green
    }
    
    private let azorius: OptionSetEnum<MagicColor> = [.white, .blue]
    private let orzhov: OptionSetEnum<MagicColor> = [.white, .black]
    private let boros: OptionSetEnum<MagicColor> = [.white, .red]
    private let selesnya: OptionSetEnum<MagicColor> = [.white, .green]
    private let dimir: OptionSetEnum<MagicColor> = [.blue, .black]
    private let izzet: OptionSetEnum<MagicColor> = [.blue, .red]
    private let simic: OptionSetEnum<MagicColor> = [.blue, .green]
    private let rakdos: OptionSetEnum<MagicColor> = [.black, .red]
    private let golgari: OptionSetEnum<MagicColor> = [.black, .green]
    private let gruul: OptionSetEnum<MagicColor> = [.red, .green]
    
    private let bant: OptionSetEnum<MagicColor> = [.green, .white, .blue]
    private let esper: OptionSetEnum<MagicColor> = [.white, .blue, .black]
    private let grixis: OptionSetEnum<MagicColor> = [.blue, .black, .red]
    private let jund: OptionSetEnum<MagicColor> = [.black, .red, .green]
    private let naya: OptionSetEnum<MagicColor> = [.red, .green, .white]
    private let abzan: OptionSetEnum<MagicColor> = [.white, .black, .green]
    private let jeskai: OptionSetEnum<MagicColor> = [.blue, .red, .white]
    private let sultai: OptionSetEnum<MagicColor> = [.blue, .green, .black]
    private let mardu: OptionSetEnum<MagicColor> = [.red, .white, .black]
    private let temur: OptionSetEnum<MagicColor> = [.green, .blue, .red]
    
    private let sansWhite: OptionSetEnum<MagicColor> = [.blue, .black, .red, .green]
    private let sansBlue: OptionSetEnum<MagicColor> = [.black, .red, .green, .white]
    private let sansBlack: OptionSetEnum<MagicColor> = [.red, .green, .white, .blue]
    private let sansRed: OptionSetEnum<MagicColor> = [.green, .white, .blue, .black]
    private let sansGreen: OptionSetEnum<MagicColor> = [.white, .blue, .black, .red]
    
    func testNoValue() {
        let test: OptionSetEnum<MagicColor> = []
        let test2 = OptionSetEnum<MagicColor>()
        
        XCTAssertEqual(test.rawValue, 0)
        XCTAssertEqual(test2.rawValue, 0)
    }
    
    func testSingleValue() {
        let white: OptionSetEnum<MagicColor> =  [.white]
        let blue: OptionSetEnum<MagicColor> = [.blue]
        let black: OptionSetEnum<MagicColor> = [.black]
        let red: OptionSetEnum<MagicColor> = [.red]
        let green: OptionSetEnum = [MagicColor.green]
        
        let whiteExpect = 1 << 0
        let blueExpect = 1 << 1
        let blackExpect = 1 << 2
        let redExpect = 1 << 3
        let greenExpect = 1 << 4
        
        XCTAssertEqual(white.rawValue, whiteExpect)
        XCTAssertEqual(blue.rawValue, blueExpect)
        XCTAssertEqual(black.rawValue, blackExpect)
        XCTAssertEqual(red.rawValue, redExpect)
        XCTAssertEqual(green.rawValue, greenExpect)
    }
    
    func testMultiValues() {
        let azoriusExpect = 3
        let orzhovExpect = 5
        let borosExpect = 9
        let selesnyaExpect = 17
        let dimirExpect = 6
        let izzetExpect = 10
        let simicExpect = 18
        let rakdosExpect = 12
        let golgariExpect = 20
        let gruulExpect = 24
        
        let bantExpect = 19
        let esperExpect = 7
        let grixisExpect = 14
        let jundExpect = 28
        let nayaExpect = 25
        let abzanExpect = 21
        let jeskaiExpect = 11
        let sultaiExpect = 22
        let marduExpect = 13
        let temurExpect = 26
        
        let sansWhiteExpect = 31 - 1
        let sansBlueExpect = 31 - 2
        let sansBlackExpect = 31 - 4
        let sansRedExpect = 31 - 8
        let sansGreenExpect = 31 - 16
        
        XCTAssertEqual(azorius.rawValue, azoriusExpect)
        XCTAssertEqual(orzhov.rawValue, orzhovExpect)
        XCTAssertEqual(boros.rawValue, borosExpect)
        XCTAssertEqual(selesnya.rawValue, selesnyaExpect)
        XCTAssertEqual(dimir.rawValue, dimirExpect)
        XCTAssertEqual(izzet.rawValue, izzetExpect)
        XCTAssertEqual(simic.rawValue, simicExpect)
        XCTAssertEqual(rakdos.rawValue, rakdosExpect)
        XCTAssertEqual(golgari.rawValue, golgariExpect)
        XCTAssertEqual(gruul.rawValue, gruulExpect)
        
        XCTAssertEqual(bant.rawValue, bantExpect)
        XCTAssertEqual(esper.rawValue, esperExpect)
        XCTAssertEqual(grixis.rawValue, grixisExpect)
        XCTAssertEqual(jund.rawValue, jundExpect)
        XCTAssertEqual(naya.rawValue, nayaExpect)
        XCTAssertEqual(abzan.rawValue, abzanExpect)
        XCTAssertEqual(jeskai.rawValue, jeskaiExpect)
        XCTAssertEqual(sultai.rawValue, sultaiExpect)
        XCTAssertEqual(mardu.rawValue, marduExpect)
        XCTAssertEqual(temur.rawValue, temurExpect)
        
        XCTAssertEqual(sansWhite.rawValue, sansWhiteExpect)
        XCTAssertEqual(sansBlue.rawValue, sansBlueExpect)
        XCTAssertEqual(sansBlack.rawValue, sansBlackExpect)
        XCTAssertEqual(sansRed.rawValue, sansRedExpect)
        XCTAssertEqual(sansGreen.rawValue, sansGreenExpect)
    }
    
    func testAllValues() {
        let all: OptionSetEnum<MagicColor> = [.white, .blue, .black, .red, .green]
        let expect = 31
        XCTAssertEqual(all.rawValue, expect)
    }
    
    func testUnion() {
        var options0: OptionSetEnum<MagicColor> = []
        var options1: OptionSetEnum<MagicColor> = [.white]
        var options2: OptionSetEnum<MagicColor> = orzhov
        var options3: OptionSetEnum<MagicColor> = jeskai
        
        let expect0: OptionSetEnum<MagicColor> = izzet
        let expect1: OptionSetEnum<MagicColor> = jeskai
        let expect2: OptionSetEnum<MagicColor> = sansGreen
        let expect3: OptionSetEnum<MagicColor> = jeskai
        
        options0.update(with: izzet)
        options1.update(with: izzet)
        options2.update(with: izzet)
        options3.update(with: izzet)
        
        XCTAssertEqual(options0, expect0)
        XCTAssertEqual(options1, expect1)
        XCTAssertEqual(options2, expect2)
        XCTAssertEqual(options3, expect3)
    }
    
    func testContains() {
        let options0: OptionSetEnum<MagicColor> = []
        let options1: OptionSetEnum<MagicColor> = [.white]
        let options2: OptionSetEnum<MagicColor> = orzhov
        let options3: OptionSetEnum<MagicColor> = jeskai
        
        let toTest1: OptionSetEnum<MagicColor> = [.white]
        let toTest2: OptionSetEnum<MagicColor> = izzet
        
        let result0toTest1 = options0.contains(toTest1)
        let result1toTest1 = options1.contains(toTest1)
        let result2toTest1 = options2.contains(toTest1)
        let result3toTest1 = options3.contains(toTest1)
        let result0toTest2 = options0.contains(toTest2)
        let result1toTest2 = options1.contains(toTest2)
        let result2toTest2 = options2.contains(toTest2)
        let result3toTest2 = options3.contains(toTest2)
        
        XCTAssertEqual(result0toTest1, false)
        XCTAssertEqual(result1toTest1, true)
        XCTAssertEqual(result2toTest1, true)
        XCTAssertEqual(result3toTest1, true)
        XCTAssertEqual(result0toTest2, false)
        XCTAssertEqual(result1toTest2, false)
        XCTAssertEqual(result2toTest2, false)
        XCTAssertEqual(result3toTest2, true)
    }

    static var allTests = [
        ("testNoValue", testNoValue),
        ("testSingleValue", testSingleValue),
        ("testMultiValues", testMultiValues),
        ("testAllValues", testAllValues),
        ("testUnion", testUnion),
        ("testContains", testContains),
    ]
}
