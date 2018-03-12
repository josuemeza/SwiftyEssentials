//
//  IntTests.swift
//  SwiftyEssentials_Tests
//
//  Created by Josue Meza Peña on 12-03-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class IntTests: XCTestCase {
    
    // MARK: - XCTestCase methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

extension IntTests {
    
    func testMinutes() {
        XCTAssert(1.minutes == 60, "\(1.minutes) may be 60.")
    }
    
    func testHours() {
        XCTAssert(1.hours == 3600, "\(1.hours) may be 3.600.")
    }
    
    func testDays() {
        XCTAssert(1.days == 86400, "\(1.hours) may be 86.400.")
    }
    
}
