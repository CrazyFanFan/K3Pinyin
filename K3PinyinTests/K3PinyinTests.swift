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
    
    let string = "中国"
    
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
    
    // MARK: single option test
    func testToPinyin() {
        XCTAssertEqual(string.k3.pinyin, "zhōng guó")
    }
    
    func testStripCombiningMarks() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks]), "zhong guo")
    }
    
    
    func testStripWhitespace() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace]), "zhōngguó")
    }
    
    func testOnlyFirstCharactor() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor]), "zhōng")
    }
    
    func testOnlyFirstLetter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstLetter]), "z")
    }
    
    func testAllFirstCharactor() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter]), "z g")
    }
    
    func testCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.capitalized]), "Zhōng Guó")
    }
    
    // MARK: Combination two options test
    func testStripCombiningMarksAndStripWhitespace() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .stripWhitespace]), "zhongguo")
    }
    
    func testStripCombiningMarksAndOnlyFirstCharactor() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstCharactor]), "zhong")
    }
    
    func testStripCombiningMarksAndOnlyFirstLetter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .onlyFirstLetter]), "z")
    }
    
    func testStripCombiningMarksAndAllFirstLetter() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .allFirstLetter]), "z g")
    }
    
    func testStripCombiningMarksAndCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks, .capitalized]), "Zhong Guo")
    }
    
    func testStripWhitespaceAndOnlyFirstCharactor() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstCharactor]), "zhōng")
    }
    
    func testStripWhitespaceAndOnlyFirstLetter() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .onlyFirstLetter]), "z")
    }
    
    func testStripWhitespaceAndAllFirstLetter() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .allFirstLetter]), "zg")
    }
    
    func testStripWhitespaceAndCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace, .capitalized]), "ZhōngGuó")
    }
    
    func testOnlyFirstCharactorAndOnlyFirstLetter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .onlyFirstLetter]), "z")
    }
    
    func testOnlyFirstCharactorAndAllFirstLetter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .allFirstLetter]), "z")
    }
    
    func testOnlyFirstCharactorAndCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor, .capitalized]), "Zhōng")
    }
    
    func testOnlyFirstLetterAndAllFirstLetter() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstLetter, .allFirstLetter]), "z")
    }
    
    func testOnlyFirstLetterAndCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.onlyFirstLetter, .capitalized]), "Z")
    }
    
    func testAllFirstLetterAndCapitalized() {
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter, .capitalized]), "Z G")
    }
    
}
