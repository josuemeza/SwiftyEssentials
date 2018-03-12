//
//  Int.swift
//  SwiftyEssentials
//
//  Created by Josue Meza Peña on 12-03-18.
//

import Foundation

public extension Int {
    
    // MARK: - Time int values
    
    /// Int representation of minutes in seconds value.
    public var minutes: Int { return self * 60 }
    /// Int representation of hours in seconds value.
    public var hours: Int { return self * 60 * 60 }
    /// Int representation of days in seconds value.
    public var days: Int { return self * 60 * 60 * 24 }
    
}
