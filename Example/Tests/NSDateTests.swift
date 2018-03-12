//
//  NSDateTests.swift
//  SwiftyEssentials_Tests
//
//  Created by Josue Meza Peña on 12-03-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class NSDateTests: XCTestCase {
    
    // MARK: - XCTestCase methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

extension NSDateTests {
    
    func testToDate() {
        let nsdate = NSDate()
        XCTAssert(nsdate.toDate is Date, "Error on Date cast")
    }
    
}
