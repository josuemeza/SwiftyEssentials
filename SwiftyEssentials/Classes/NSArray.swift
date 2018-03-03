//
//  NSArray.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import Foundation

public extension NSArray {
    
    /// :nodoc:
    @available(*, deprecated)
    static func arrayFromJSONFile(_ file: String, ofType type: String) -> NSArray? {
        // TODO: Compare with SwiftyJSON
        if let text = String.stringFromBundleFile(file, ofType: type) {
            if let data = text.data(using: String.Encoding.utf8.rawValue) {
                if let json = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as? NSArray {
                    return json
                }
            }
        }
        return nil
    }
    
}
