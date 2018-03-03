//
//  NSAttributedString.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    // MARK: - Methods
    
    /**
     **allAttributes**
     
     Get all attributes of self attributed string.
     
     - Returns: Dictionary with all attributes in self attributed string.
     */
    func allAttributes() -> [NSAttributedStringKey : Any] {
        return self.attributes(at: 0, longestEffectiveRange: nil, in: NSMakeRange(0, self.length)) as [NSAttributedStringKey : Any]
    }
    
}
