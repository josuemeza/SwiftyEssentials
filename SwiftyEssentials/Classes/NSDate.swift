//
//  NSDate.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
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
