//
//  K3PinyinTests.swift
//  K3PinyinTests
//
//  Created by Crazy凡 on 2018/2/24.
//  Copyright © 2018年 Crazy凡. All rights reserved.
//

import XCTest
@testable import K3Pinyin

class K3PinyinTests: XCTestCase {
    let string: NSString = "中国"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // 和一个拼音库的资源进行对比，校验正确率，部分多音字Case无法通过
    func testExample() {
//        for (pinyin, str) in testPinyinMap {
//            autoreleasepool(invoking: {
//                for char in str {
//                    autoreleasepool(invoking: {
//                        XCTAssertEqual(pinyin.lowercased(), "\(char)".k3.pinyin([.stripCombiningMarks]), "\(char)")
//                    })
//                }
//            })
//        }
    }

    // 将全部字符进行一次取拼音操作，测试下性能
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
//            print(testPinyinMap.description.k3.pinyin)
        }
    }

    func testNilOption() {
        XCTAssertEqual(string.k3.pinyin(nil), "zhōngguó")
        string.k3.pinyin(nil) { (pinyin) in
            XCTAssertEqual(pinyin, "zhōngguó")
        }
    }

    func testEmptyOption() {
        XCTAssertEqual(string.k3.pinyin([]), "zhōngguó")
    }

    func testStripcombiningmarks() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks]), "zhongguo")
    }

    func testStripcombiningmarksSeparator() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator("")]), "zhongguo")
    }

    func testStripcombiningmarksSeparatorOnlyfirstCharacter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .onlyFirstCharacter]), "zhong")
    }

    func testStripcombiningmarksSeparatorOnlyfirstCharacterAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .onlyFirstCharacter, .allFirstLetter]), "z")
    }

    func testStripcombiningmarksSeparatorOnlyfirstCharacterAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks,
                                         .separator(""),
                                         .onlyFirstCharacter,
                                         .allFirstLetter,
                                         .onlyFirstLetter]), "z")
    }

    func testStripcombiningmarksSeparatorOnlyfirstCharacterAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks,
                                         .separator(""),
                                         .onlyFirstCharacter,
                                         .allFirstLetter,
                                         .onlyFirstLetter,
                                         .capitalized]), "Z")
    }

    func testStripcombiningmarksSeparatorOnlyfirstCharacterAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .onlyFirstCharacter, .allFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksSeparatorOnlyfirstCharacterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .onlyFirstCharacter, .onlyFirstLetter]), "z")
    }

    func testStripcombiningmarksSeparatorOnlyfirstCharacterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .onlyFirstCharacter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksSeparatorOnlyfirstCharacterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .onlyFirstCharacter, .capitalized]), "Zhong")
    }

    func testStripcombiningmarksSeparatorAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .allFirstLetter]), "zg")
    }

    func testStripcombiningmarksSeparatorAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .allFirstLetter, .onlyFirstLetter]), "z")
    }

    func testStripcombiningmarksSeparatorAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksSeparatorAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .allFirstLetter, .capitalized]), "ZG")
    }

    func testStripcombiningmarksSeparatorOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .onlyFirstLetter]), "z")
    }

    func testStripcombiningmarksSeparatorOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .onlyFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksSeparatorCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .separator(""), .capitalized]), "ZhongGuo")
    }

    func testStripcombiningmarksOnlyfirstCharacter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharacter]), "zhong")
    }

    func testStripcombiningmarksOnlyfirstCharacterAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharacter, .allFirstLetter]), "z")
    }

    func testStripcombiningmarksOnlyfirstCharacterAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharacter, .allFirstLetter, .onlyFirstLetter]), "z")
    }

    func testStripcombiningmarksOnlyfirstCharacterAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharacter, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksOnlyfirstCharacterAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharacter, .allFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksOnlyfirstCharacterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharacter, .onlyFirstLetter]), "z")
    }

    func testStripcombiningmarksOnlyfirstCharacterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharacter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksOnlyfirstCharacterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharacter, .capitalized]), "Zhong")
    }

    func testStripcombiningmarksAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter]), "zg")
    }

    func testStripcombiningmarksAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter, .onlyFirstLetter]), "z")
    }

    func testStripcombiningmarksAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter, .capitalized]), "ZG")
    }

    func testStripcombiningmarksOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstLetter]), "z")
    }

    func testStripcombiningmarksOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testStripcombiningmarksCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .capitalized]), "ZhongGuo")
    }

    func testSeparator() {
        XCTAssertEqual(string.k3.pinyin([.separator("")]), "zhōngguó")
        XCTAssertEqual(string.k3.pinyin([.separator("A")]), "zhōngAguó")
        XCTAssertEqual(string.k3.pinyin([.separator(" ")]), "zhōng guó")
        XCTAssertEqual(string.k3.pinyin([.separator("zhōng gu")]), "zhōngzhōng guguó")
    }

    func testSeparatorOnlyfirstCharacter() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstCharacter]), "zhōng")
    }

    func testSeparatorOnlyfirstCharacterAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstCharacter, .allFirstLetter]), "z")
    }

    func testSeparatorOnlyfirstCharacterAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstCharacter, .allFirstLetter, .onlyFirstLetter]), "z")
    }

    func testSeparatorOnlyfirstCharacterAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstCharacter, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testSeparatorOnlyfirstCharacterAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstCharacter, .allFirstLetter, .capitalized]), "Z")
    }

    func testSeparatorOnlyfirstCharacterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstCharacter, .onlyFirstLetter]), "z")
    }

    func testSeparatorOnlyfirstCharacterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstCharacter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testSeparatorOnlyfirstCharacterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstCharacter, .capitalized]), "Zhōng")
    }

    func testSeparatorAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .allFirstLetter]), "zg")
    }

    func testSeparatorAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .allFirstLetter, .onlyFirstLetter]), "z")
    }

    func testSeparatorAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testSeparatorAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .allFirstLetter, .capitalized]), "ZG")
    }

    func testSeparatorOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstLetter]), "z")
    }

    func testSeparatorOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .onlyFirstLetter, .capitalized]), "Z")
    }

    func testSeparatorCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.separator(""), .capitalized]), "ZhōngGuó")
    }

    func testOnlyfirstCharacter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharacter]), "zhōng")
    }

    func testOnlyfirstCharacterAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharacter, .allFirstLetter]), "z")
    }

    func testOnlyfirstCharacterAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharacter, .allFirstLetter, .onlyFirstLetter]), "z")
    }

    func testOnlyfirstCharacterAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharacter, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testOnlyfirstCharacterAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharacter, .allFirstLetter, .capitalized]), "Z")
    }

    func testOnlyfirstCharacterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharacter, .onlyFirstLetter]), "z")
    }

    func testOnlyfirstCharacterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharacter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testOnlyfirstCharacterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharacter, .capitalized]), "Zhōng")
    }

    func testAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter]), "zg")
    }

    func testAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter, .onlyFirstLetter]), "z")
    }

    func testAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }

    func testAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter, .capitalized]), "ZG")
    }

    func testOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstLetter]), "z")
    }

    func testOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstLetter, .capitalized]), "Z")
    }

    func testCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.capitalized]), "ZhōngGuó")
    }

    func testMakeTestCase() {
        makeTestCase()
    }

    private func makeTestCase() {
        let options = [
            "stripCombiningMarks",
            "Separator",
            "onlyFirstCharacter",
            "allFirstLetter",
            "onlyFirstLetter",
            "capitalized"]

        let combs = combination(options)
        for comb in combs {
            print(
                """
                func test\(comb.map { $0.capitalized }.joined())() {
                XCTAssertEqual(string.k3.pinyin([.\(comb.joined(separator: ", ."))]), "")
                }

                """
            )
        }
    }

    func testCombination() {
        let t = combination([1, 2, 3, 4, 5])
        print(t)
    }

    private func combination<T>(_ items: [T]) -> [[T]] {
        if items.count == 1 {
            return [items]
        }

        let moreCom = combination(Array(items[1...]))

        return ([[items[0]]] + moreCom.map { (singleCom) -> [T] in
            var temCom = Array(singleCom)
            temCom.insert(items[0], at: 0)
            return temCom
        } + moreCom)
    }
}
