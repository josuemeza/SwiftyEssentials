//
//  StringTests.swift
//  SwiftyEssentials_Tests
//
//  Created by Josue Meza Peña on 12-03-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {
    
    // MARK: - XCTestCase methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

extension StringTests {
    
    func testSubscripts() {
        let str = "lorem ipsum dolor sit amet"
        let testCase1: String = str[0]
        let testCase2: Character = str[1]
        let testCase3 = str[0..<5]
        XCTAssert(testCase1 == "l" && testCase2 == Character("o") && testCase3 == "lorem", "Some subscript has error.")
    }
    
    func testNSString() {
        let str = "lorem ipsum dolor sit amet"
        XCTAssert(str.nsstring is NSString, "Error on parse to NSString.")
    }
    
    func testCapitalizingFirstLetter() {
        let str = "lorem"
        XCTAssert(str.capitalizingFirstLetter == "Lorem", "Error on capitalize.")
    }
    
    func testStringByDeletingPathExtension() {
        let str = "image.png"
        XCTAssert(str.stringByDeletingPathExtension == "image", "Error deleting path extension.")
    }
    
    func testLastPathComponent() {
        let str = "lorem/ipsum/dolor/sit/amet"
        XCTAssert(str.lastPathComponent == "amet", "Error getting the last component.")
    }
    
    func testNsrange() {
        let str = "lorem ipsum dolor sit amet"
        let nsrange = NSRange(location: 0, length: 5)
        XCTAssert(str.nsrange(of: "lorem") == nsrange, "Error getting the range.")
    }
    
}
