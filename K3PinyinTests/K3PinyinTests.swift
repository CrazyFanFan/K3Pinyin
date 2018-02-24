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
        let string = "中国"
        XCTAssertEqual(string.k3.pinyin, "zhōng guó")
    }
    
    func testStripCombiningMarks() {
        let string = "中国"
        XCTAssertEqual(string.k3.pinyin([.stripCombiningMarks]), "zhong guo")
    }
    
    
    func testStripWhitespace() {
        let string = "中国"
        XCTAssertEqual(string.k3.pinyin([.stripWhitespace]), "zhōngguó")
    }
    
    func testOnlyFirstCharactor() {
        let string = "中国"
        XCTAssertEqual(string.k3.pinyin([.onlyFirstCharactor]), "zhōng")
    }
    
    func testOnlyFirstLetter() {
        let string = "中国"
        XCTAssertEqual(string.k3.pinyin([.onlyFirstLetter]), "z")
    }
    
    func testAllFirstCharactor() {
        let string = "中国"
        XCTAssertEqual(string.k3.pinyin([.allFirstLetter]), "z g")
    }
    
    func testCapitalized() {
        let string = "中国"
        XCTAssertEqual(string.k3.pinyin([.capitalized]), "Zhōng Guó")
    }
}
