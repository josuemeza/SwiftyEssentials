//
//  NSDate.swift
//  SwiftyEssentials
//
//  Created by Josue Meza Peña on 12-03-18.
//

import Foundation

public extension NSDate {
    
    // MARK: - Attributes
    
    /**
     **toDate**
     
     Get Date representation of NSDate.
     */
    var toDate: Date {
        get { return (self as Date) }
    }
    
}
