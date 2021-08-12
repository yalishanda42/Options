import XCTest
@testable import Options

final class OptionsTests: XCTestCase {
    private enum MagicColor: CaseIterable {
        case white
        case blue
        case black
        case red
        case green
    }
    
    private let azorius: Options<MagicColor> = [.white, .blue]
    private let orzhov: Options<MagicColor> = [.white, .black]
    private let boros: Options<MagicColor> = [.white, .red]
    private let selesnya: Options<MagicColor> = [.white, .green]
    private let dimir: Options<MagicColor> = [.blue, .black]
    private let izzet: Options<MagicColor> = [.blue, .red]
    private let simic: Options<MagicColor> = [.blue, .green]
    private let rakdos: Options<MagicColor> = [.black, .red]
    private let golgari: Options<MagicColor> = [.black, .green]
    private let gruul: Options<MagicColor> = [.red, .green]
    
    private let bant: Options<MagicColor> = [.green, .white, .blue]
    private let esper: Options<MagicColor> = [.white, .blue, .black]
    private let grixis: Options<MagicColor> = [.blue, .black, .red]
    private let jund: Options<MagicColor> = [.black, .red, .green]
    private let naya: Options<MagicColor> = [.red, .green, .white]
    private let abzan: Options<MagicColor> = [.white, .black, .green]
    private let jeskai: Options<MagicColor> = [.blue, .red, .white]
    private let sultai: Options<MagicColor> = [.blue, .green, .black]
    private let mardu: Options<MagicColor> = [.red, .white, .black]
    private let temur: Options<MagicColor> = [.green, .blue, .red]
    
    private let sansWhite: Options<MagicColor> = [.blue, .black, .red, .green]
    private let sansBlue: Options<MagicColor> = [.black, .red, .green, .white]
    private let sansBlack: Options<MagicColor> = [.red, .green, .white, .blue]
    private let sansRed: Options<MagicColor> = [.green, .white, .blue, .black]
    private let sansGreen: Options<MagicColor> = [.white, .blue, .black, .red]
    
    func testNoValue() {
        let test: Options<MagicColor> = []
        let test2 = Options<MagicColor>()
        
        XCTAssertEqual(test.rawValue, 0)
        XCTAssertEqual(test2.rawValue, 0)
    }
    
    func testSingleValue() {
        let white: Options<MagicColor> =  [.white]
        let blue: Options<MagicColor> = [.blue]
        let black: Options<MagicColor> = [.black]
        let red: Options<MagicColor> = [.red]
        let green: Options = [MagicColor.green]
        
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
        let all1: Options<MagicColor> = [.white, .blue, .black, .red, .green]
        let all2: Options<MagicColor> = .all
        
        let expect = 31
        
        XCTAssertEqual(all1.rawValue, expect)
        XCTAssertEqual(all2.rawValue, expect)
    }
    
    func testUnion() {
        var options0: Options<MagicColor> = []
        var options1: Options<MagicColor> = [.white]
        var options2: Options<MagicColor> = orzhov
        var options3: Options<MagicColor> = jeskai
        
        let expect0: Options<MagicColor> = izzet
        let expect1: Options<MagicColor> = jeskai
        let expect2: Options<MagicColor> = sansGreen
        let expect3: Options<MagicColor> = jeskai
        
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
        let options0: Options<MagicColor> = []
        let options1: Options<MagicColor> = [.white]
        let options2: Options<MagicColor> = orzhov
        let options3: Options<MagicColor> = jeskai
        
        let toTest1: Options<MagicColor> = [.white]
        let toTest2: Options<MagicColor> = izzet
        
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
