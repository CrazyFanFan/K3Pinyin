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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            print(testPinyinMap.description.k3.pinyin)
        }
    }
    
}
