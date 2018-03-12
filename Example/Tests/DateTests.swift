//
//  DateTests.swift
//  SwiftyEssentials_Tests
//
//  Created by Josue Meza Peña on 12-03-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class DateTests: XCTestCase {
    
    // MARK: - XCTestCase methods
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}

extension DateTests {
    
    func testParse() {
        let strDate = "2018-03-12 12:27:30"
        guard let date = Date.parse(stringDate: strDate, format: "yyyy-MM-dd HH:mm:ss") else { XCTFail("Error on parse date.") ; return }
        XCTAssert(date.string(format: "yyyy-MM-dd HH:mm:ss") == strDate, "Test case failed on date comparation.")
    }
    
    func testNow() {
        let now = Date.now(withTime: true).string(format: "yyyy-MM-dd HH:mm:ss")
        let date = Date().string(format: "yyyy-MM-dd HH:mm:ss")
        XCTAssert(now == date, "Test case failed on date comparation.")
    }
    
    func testAddDays() {
        guard let date = Date.parse(stringDate: "2018-03-31", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        let newDate = Date.add(days: 1, to: date)
        XCTAssert(newDate?.string(format: "yyyy-MM-dd") == "2018-04-01", "Test case failed on comparation.")
    }
    
    func testAddMonths() {
        guard let date = Date.parse(stringDate: "2018-12-01", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        let newDate = Date.add(months: 1, to: date)
        XCTAssert(newDate?.string(format: "yyyy-MM-dd") == "2019-01-01", "Test case failed on comparation.")
    }
    
    func testAddYears() {
        guard let date = Date.parse(stringDate: "2018-12-01", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        let newDate = Date.add(years: 1, to: date)
        XCTAssert(newDate?.string(format: "yyyy-MM-dd") == "2019-12-01", "Test case failed on comparation.")
    }
    
    func testSubtractDays() {
        guard let date = Date.parse(stringDate: "2018-12-01", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        let newDate = Date.subtract(days: 1, to: date)
        XCTAssert(newDate?.string(format: "yyyy-MM-dd") == "2018-11-30", "Test case failed on comparation.")
    }
    
    func testSubtractMonths() {
        guard let date = Date.parse(stringDate: "2018-01-01", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        let newDate = Date.subtract(months: 1, to: date)
        XCTAssert(newDate?.string(format: "yyyy-MM-dd") == "2017-12-01", "Test case failed on comparation.")
    }
    
    func testSubtractYears() {
        guard let date = Date.parse(stringDate: "2018-01-01", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        let newDate = Date.subtract(years: 1, to: date)
        XCTAssert(newDate?.string(format: "yyyy-MM-dd") == "2017-01-01", "Test case failed on comparation.")
    }
    
    func testFromTimestamp() {
        let date = Date.fromTimestamp(timestamp: 1520870442000)
        XCTAssert(date?.string(format: "yyyy-MM-dd HH:mm:ss", locale: "en_US") == "2018-03-12 13:00:42", "Test case failed on comparation.")
    }
    
    func testString() {
        let strDate = "2018-03-12 13:11:30"
        let parsed = Date.parse(stringDate: strDate, format: "yyyy-MM-dd HH:mm:ss")
        XCTAssert(parsed?.string(format: "yyyy-MM-dd HH:mm:ss") == strDate, "Test case failed on comparation.")
    }
    
    func testIsLaterThan() {
        guard let date1 = Date.parse(stringDate: "2018-03-12", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        guard let date2 = Date.parse(stringDate: "2018-02-12", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        XCTAssert(date1.isLaterThan(date2), "Test case failed on comparation.")
    }
    
    func testIsEarlierThan() {
        guard let date1 = Date.parse(stringDate: "2018-02-12", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        guard let date2 = Date.parse(stringDate: "2018-03-12", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        XCTAssert(date1.isEarlierThan(date2), "Test case failed on comparation.")
    }
    
    func testIsEqualThan() {
        guard let date1 = Date.parse(stringDate: "2018-03-12", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        guard let date2 = Date.parse(stringDate: "2018-03-12", format: "yyyy-MM-dd") else { XCTFail("Error on parse date.") ; return }
        XCTAssert(date1.isEqualThan(date2), "Test case failed on comparation.")
    }
    
}
