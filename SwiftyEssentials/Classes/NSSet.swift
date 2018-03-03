//
//  NSSet.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import Foundation

public extension NSSet {
    
    /// :nodoc:
    @available(*, deprecated)
    class func setAppend(_ set: NSSet, value: AnyObject) -> NSSet {
        var array = set.allObjects as [AnyObject]
        array.append(value)
        return NSSet(array: array)
    }
    
    /**
         **remove(element:)**
     
         Create a new NSSet removing the parameter element.
     
         - Parameters:
             - element: Element to remove from set.
         - Returns: A new set with same elements removing the parameter element.
     */
    func removing<T:Equatable>(_ element: T) -> NSSet? {
        var array = self.allObjects as! [T]
        guard let index = array.index(of: element) else { return nil }
        array.remove(at: index)
        return NSSet(array: array)
    }
    
}
