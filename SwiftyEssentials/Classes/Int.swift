//
//  Int.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import Foundation

public extension Int {
    
    // MARK: - Time int values
    
    /// Int representation of minutes in seconds.
    var minutes: Int { return self * 60 }
    /// Int representation of hours in seconds.
    var hours: Int { return self * 60 * 60 }
    /// Int representation of days in seconds.
    var days: Int { return self * 60 * 60 * 24 }
    
}
