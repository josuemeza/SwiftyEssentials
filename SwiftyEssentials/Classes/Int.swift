//
//  Int.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import Foundation

extension Int {
    
    // MARK: - Time int values
    
    var minutes: Int { return self * 60 }
    var hours: Int { return self * 60 * 60 }
    var days: Int { return self * 60 * 60 * 24 }
    
}
