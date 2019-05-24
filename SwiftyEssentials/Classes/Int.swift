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
    var minutes: Int { return self * 60 }
    /// Int representation of hours in seconds value.
    var hours: Int { return self * 60 * 60 }
    /// Int representation of days in seconds value.
    var days: Int { return self * 60 * 60 * 24 }
    
}

public extension BinaryInteger {
    
    /**
     **stringThousandFormatted**
     
     Makes a string representation of the number with thousand separator.
     
     - Parameter separator: String to separate this number in thousands format.
     - Returns: A string representation of this number with thousand separator.
     */
    func stringThousandFormatted(with separator: String) -> String? {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = separator
        formatter.numberStyle = .decimal
        return formatter.string(for: self)
    }
    
}
