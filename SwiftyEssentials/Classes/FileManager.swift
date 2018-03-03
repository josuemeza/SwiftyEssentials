//
//  FileManager.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import Foundation

extension FileManager {
    
    // MARK: - Methods
    
    /**
     **directoryExistsAtPath**
     
     Check if the directory in path parameter exists.
     
     - Parameter path: string with path to check.
     - Returns: true if the path exists.
     */
    func directoryExistsAtPath(_ path: String) -> Bool {
        var isDirectory: ObjCBool = false
        if Foundation.FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory) {
            if isDirectory.boolValue {
                return true
            }
        }
        return false
    }
    
}
