//
//  Array.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import Foundation

public extension Array where Iterator.Element == Bool {
    
    // MARK: - Bool array methods
    
    /**
     **any**
     
     Equals to comparation by disjunction.
     [Only for Bool array]
     */
    var any: Bool {
        get {
            for item in self {
                if item {
                    return true
                }
            }
            return false
        }
    }
    
    /**
     **all**
     
     Equals to comparation by conjunction.
     [Only for Bool array]
     */
    var all: Bool {
        get {
            for item in self {
                if !item {
                    return false
                }
            }
            return true
        }
    }
    
}

public extension Array where Element: NSAttributedString {
    
    // MARK: - NSAttributedString array methods
    
    /**
     **joined(separator:)**
     
     Returns a new NSAttributedString by concatenating the elements of the sequence, adding the given separator between each element.
     - Parameter separator: A string to insert between each of the elements in this sequence. The default separator is an empty string.
     - Returns: A single, concatenated NSAttributedString.
     */
    func joined(separator: NSAttributedString) -> NSAttributedString {
        if self.count > 0 {
            let mutableString = NSMutableAttributedString(attributedString: self[0])
            for index in 1 ..< self.count {
                mutableString.append(separator)
                mutableString.append(self[index])
            }
            return NSAttributedString(attributedString: mutableString)
        } else {
            return NSAttributedString(string: "")
        }
    }
    
}

public extension Array where Element: Equatable {
    
    // MARK: - Equatable array methods
    
    /**
     **remove**
     
     Remove all objects equal to the parameter in array.
     
     - Parameter object: Object to remove.
     */
    mutating func remove(_ object: Element) {
        for i in stride(from: (self.count-1), through: 0, by: -1) {
            if self[i] == object {
                self.remove(at: i)
            }
        }
    }
    
    /**
     **unique**
     
     Delete all repeated elements.
     */
    mutating func unique() {
        var unique = [Element]()
        self.forEach { item in
            if !unique.contains(item) {
                unique.append(item)
            }
        }
        self.removeAll()
        self.append(contentsOf: unique)
    }
    
}

public extension Array {
    
    // MARK: - General array methods
    
    /// True if the array has only one element
    var hasOnlyOneElement: Bool { get { return self.count == 1 } }
    /// Return an element if is the only one in the array.
    var theOnlyOneElement: Element? { get { return self.hasOnlyOneElement ? self.first! : nil } }
    
    /**
     **take**
     
     Take the first n elements of array.
     
     - Parameter n: Elements to take.
     - Returns: Array with the taken elements.
     */
    func take(_ n: Int) -> Array<Element> {
        if n > self.count {
            return self
        }
        return Array(self[0...(n-1)])
    }
    
    /**
     **groupOf**
     
     Group the array elements in subarrays of n elements each one.
     
     - Parameter n: Elements per group.
     - Returns: An array of group arrays.
     */
    func groupOf(_ n: Int) -> [Array<Element>] {
        var array = self
        var group : [Array<Element>] = []
        while array.count > 0 {
            group.append(array.take(n))
            if array.count < n {
                array.removeAll()
            } else {
                array.removeFirst(n)
            }
        }
        return group
    }
    
    // MARK: Stack array methods
    
    /**
     **push**
     
     Push the parameter element at first.
     */
    mutating func push(_ element: Element) {
        self.append(element)
    }
    
    /**
     **pop**
     
     Pop the last element.
     
     - Returns: The last element of the array.
     */
    mutating func pop() -> Element? {
        return self.removeLast()
    }
    
    // MARK: Queue array methods
    
    /**
     **euqueue**
     
     Enqueue the parameter element at end.
     */
    mutating func enqueue(_ element: Element) {
        self.append(element)
    }
    
    /**
     **dequeue**
     
     Dequeue the first element.
     
     - Returns: The first element of the array.
     */
    mutating func dequeue() -> Element? {
        return self.removeFirst()
    }
    
}

