//
//  Timer.swift
//  SwiftyEssentials
//
//  Created by Josue Meza Peña on 12-03-18.
//

import Foundation

public extension Timer {
    
    // MARK: - Class functions
    
    /**
     **callbackInDuration**
     
     Call the parameter block in the parameter seconds.
     
     - Parameter seconds: Seconds to call the block.
     - Parameter callback: Block to call after parameter seconds.
     */
    class func callbackInDuration(_ seconds: Double, callback: @escaping () -> Void) {
        let delay = seconds * Double(NSEC_PER_SEC)
        let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time) {
            callback()
        }
    }
    
}
