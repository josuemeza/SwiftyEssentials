//
//  Array.swift
//  SwiftyEssentials_Tests
//
//  Created by Josue Meza Peña on 03-03-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import SwiftyEssentials

class ArrayTests: XCTestCase {
    
    // MARK: - XCTestCase methods
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

extension ArrayTests {
    
    // MARK: - Bool array tests
    
    func testAny() {
        let testCases: [(result: Bool, test: [Bool])] = [
            (result: true, test: [true, true]),
            (result: true, test: [true, false]),
            (result: false, test: [false, false])
        ]
        for testCase in testCases {
            if testCase.result != testCase.test.any {
                XCTFail("The case \(testCase.test) may be \(testCase.result)")
            }
        }
        XCTAssert(true, "It works")
    }
    
    func testAll() {
        let testCases: [(result: Bool, test: [Bool])] = [
            (result: true, test: [true, true]),
            (result: false, test: [true, false]),
            (result: false, test: [false, false])
        ]
        for testCase in testCases {
            if testCase.result != testCase.test.all {
                XCTFail("The case \(testCase.test) may be \(testCase.result)")
            }
        }
        XCTAssert(true, "It works")
    }
    
}

extension ArrayTests {
    
    // MARK: - NSAttributedString array tests
    
    func testJoined() {
        let array: [NSAttributedString] = [NSAttributedString(string: "Lorem ipsum"), NSAttributedString(string: "sit amet")]
        let separator = NSAttributedString(string: " dolor ")
        print(array.joined(separator: separator).string)
        if array.joined(separator: separator).string != "Lorem ipsum dolor sit amet" {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
}

extension ArrayTests {
    
    // MARK: - Equatable array tests
    
    class EquatebleClass: Equatable {
        
        var id: Int
        var value: String
        
        init(id: Int, value: String) {
            self.id = id
            self.value = value
        }
        
        static func == (lhs: EquatebleClass, rhs: EquatebleClass) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    func testRemove() {
        var testValues: [EquatebleClass] = [
            EquatebleClass(id: 1, value: "1"),
            EquatebleClass(id: 2, value: "2")
        ]
        testValues.remove(testValues[1])
        if testValues.count != 1 {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
    func testUnique() {
        var testValues: [EquatebleClass] = [
            EquatebleClass(id: 1, value: "1"),
            EquatebleClass(id: 1, value: "1"),
            EquatebleClass(id: 1, value: "1"),
            EquatebleClass(id: 2, value: "2"),
            EquatebleClass(id: 2, value: "2")
        ]
        testValues.unique()
        if testValues.count != 2 {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
}

extension ArrayTests {
    
    // MARK: - Stack array tests
    
    func testPush() {
        var stack = [Int]()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        if stack != [1, 2, 3] {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
    func testPop() {
        var stack = [1, 2, 3]
        var last = stack.pop()
        if stack != [1, 2] || last != 3 {
            XCTFail("Spected result is not valid")
        }
        last = stack.pop()
        if stack != [1] || last != 2 {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
}

extension ArrayTests {
    
    // MARK: - Queue array tests
    
    func testEnqueue() {
        var queue = [Int]()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        if queue != [1, 2, 3] {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
    func testDequeue() {
        var queue = [1, 2, 3]
        var first = queue.dequeue()
        if queue != [2, 3] || first != 1 {
            XCTFail("Spected result is not valid")
        }
        first = queue.dequeue()
        if queue != [3] || first != 2 {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
}

extension ArrayTests {
    
    // MARK: - General array tests
    
    func testHasOnlyOneElement() {
        let testArray1 = [1]
        let testArray2 = [1, 2, 3]
        if !testArray1.hasOnlyOneElement || testArray2.hasOnlyOneElement {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
    func testTheOnlyOneElement() {
        let testArray1 = [1]
        let testArray2 = [1, 2, 3]
        if testArray1.theOnlyOneElement != testArray1[0] || testArray2.theOnlyOneElement != nil {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
    func testTake() {
        let testArray1 = [1]
        let testArray2 = [1, 2, 3]
        if testArray1.take(3).count != 1 || testArray2.take(3).count != 3 {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
    func testGroupOf() {
        let testArray = [1, 2, 3, 4, 5, 6, 7, 8]
        let group = testArray.groupOf(5)
        if group.count != 2 || group[0].count != 5 || group[1].count != 3 {
            XCTFail("Spected result is not valid")
        }
        XCTAssert(true, "It works")
    }
    
}
