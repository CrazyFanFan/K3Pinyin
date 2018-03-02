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
    
    let string:NSString = "中国"  
    
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
        for (pinyin, str) in testPinyinMap {
            var s = str.startIndex
            while s < str.endIndex {
                autoreleasepool(invoking: {
                    let te = str.index(s, offsetBy: 1)
                    let char = String(str[s..<te])
                    XCTAssertEqual(pinyin.lowercased(), char.k3.pinyin, char+pinyin)
                    s = te
                })
            }
        }
    }
    
    // 将全部字符进行一次取拼音操作，测试下性能
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            print(testPinyinMap.description.k3.pinyin)
        }
    }
    
    func testNilOption() {
        XCTAssertEqual(string.k3.pinyin(nil), "zhōng guó")
        string.k3.pinyin(nil) { (pinyin) in
            XCTAssertEqual(pinyin, "zhōng guó")
        }
    }
    
    func testEmptyOption() {
        XCTAssertEqual(string.k3.pinyin([]), "zhōng guó")
    }
    
    func testStripcombiningmarks() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks]), "zhong guo")
    }
    
    func testStripcombiningmarksStripwhitespace() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace]), "zhongguo")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstcharactor() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstCharactor]), "zhong")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstcharactorAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstCharactor, .allFirstLetter]), "z")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstcharactorAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstCharactor, .allFirstLetter, .onlyFirstLetter]), "z")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstcharactorAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstCharactor, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstcharactorAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstCharactor, .allFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstcharactorOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstCharactor, .onlyFirstLetter]), "z")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstcharactorOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstCharactor, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstcharactorCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstCharactor, .capitalized]), "Zhong")
    }
    
    func testStripcombiningmarksStripwhitespaceAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .allFirstLetter]), "zg")
    }
    
    func testStripcombiningmarksStripwhitespaceAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .allFirstLetter, .onlyFirstLetter]), "z")
    }
    
    func testStripcombiningmarksStripwhitespaceAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksStripwhitespaceAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .allFirstLetter, .capitalized]), "ZG")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstLetter]), "z")
    }
    
    func testStripcombiningmarksStripwhitespaceOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksStripwhitespaceCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace, .capitalized]), "ZhongGuo")
    }
    
    func testStripcombiningmarksOnlyfirstcharactor() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor]), "zhong")
    }
    
    func testStripcombiningmarksOnlyfirstcharactorAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor, .allFirstLetter]), "z")
    }
    
    func testStripcombiningmarksOnlyfirstcharactorAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor, .allFirstLetter, .onlyFirstLetter]), "z")
    }
    
    func testStripcombiningmarksOnlyfirstcharactorAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksOnlyfirstcharactorAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor, .allFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksOnlyfirstcharactorOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor, .onlyFirstLetter]), "z")
    }
    
    func testStripcombiningmarksOnlyfirstcharactorOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksOnlyfirstcharactorCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor, .capitalized]), "Zhong")
    }
    
    func testStripcombiningmarksAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter]), "z g")
    }
    
    func testStripcombiningmarksAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter, .onlyFirstLetter]), "z")
    }
    
    func testStripcombiningmarksAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter, .capitalized]), "Z G")
    }
    
    func testStripcombiningmarksOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstLetter]), "z")
    }
    
    func testStripcombiningmarksOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripcombiningmarksCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .capitalized]), "Zhong Guo")
    }
    
    func testStripwhitespace() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace]), "zhōngguó")
    }
    
    func testStripwhitespaceOnlyfirstcharactor() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor]), "zhōng")
    }
    
    func testStripwhitespaceOnlyfirstcharactorAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor, .allFirstLetter]), "z")
    }
    
    func testStripwhitespaceOnlyfirstcharactorAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor, .allFirstLetter, .onlyFirstLetter]), "z")
    }
    
    func testStripwhitespaceOnlyfirstcharactorAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripwhitespaceOnlyfirstcharactorAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor, .allFirstLetter, .capitalized]), "Z")
    }
    
    func testStripwhitespaceOnlyfirstcharactorOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor, .onlyFirstLetter]), "z")
    }
    
    func testStripwhitespaceOnlyfirstcharactorOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripwhitespaceOnlyfirstcharactorCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor, .capitalized]), "Zhōng")
    }
    
    func testStripwhitespaceAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .allFirstLetter]), "zg")
    }
    
    func testStripwhitespaceAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .allFirstLetter, .onlyFirstLetter]), "z")
    }
    
    func testStripwhitespaceAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripwhitespaceAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .allFirstLetter, .capitalized]), "ZG")
    }
    
    func testStripwhitespaceOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstLetter]), "z")
    }
    
    func testStripwhitespaceOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testStripwhitespaceCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .capitalized]), "ZhōngGuó")
    }
    
    func testOnlyfirstcharactor() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor]), "zhōng")
    }
    
    func testOnlyfirstcharactorAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .allFirstLetter]), "z")
    }
    
    func testOnlyfirstcharactorAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .allFirstLetter, .onlyFirstLetter]), "z")
    }
    
    func testOnlyfirstcharactorAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testOnlyfirstcharactorAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .allFirstLetter, .capitalized]), "Z")
    }
    
    func testOnlyfirstcharactorOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .onlyFirstLetter]), "z")
    }
    
    func testOnlyfirstcharactorOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testOnlyfirstcharactorCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .capitalized]), "Zhōng")
    }
    
    func testAllfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter]), "z g")
    }
    
    func testAllfirstletterOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter, .onlyFirstLetter]), "z")
    }
    
    func testAllfirstletterOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter, .onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testAllfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter, .capitalized]), "Z G")
    }
    
    func testOnlyfirstletter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstLetter]), "z")
    }
    
    func testOnlyfirstletterCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.capitalized]), "Zhōng Guó")
    }
    
    func testMakeTestCase() {
        makeTestCase()
    }
    
    private func makeTestCase() {
        let options = [
        "stripCombiningMarks",
        "stripWhitespace",
        "onlyFirstCharactor",
        "allFirstLetter",
        "onlyFirstLetter",
        "capitalized"]
        
        let combs = combination(options)
        for comb in combs {
            print(
                """
                func test\(comb.map{$0.capitalized}.joined())() {
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
    
    private func combination<T>(_ items:[T]) -> [[T]] {
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
