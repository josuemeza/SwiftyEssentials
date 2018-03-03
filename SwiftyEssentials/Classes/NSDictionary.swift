//
//  NSDictionary.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    /// :nodoc:
    @available(*, deprecated)
    class func dictionaryFromJSONFile(_ file: String, ofType type: String) -> NSDictionary? {
        if let text = String.stringFromBundleFile(file, ofType: type) {
            if let data = text.data(using: String.Encoding.utf8.rawValue) {
                if let json = (try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as? NSDictionary {
                    return json
                }
            }
        }
        return nil
    }
    
}
