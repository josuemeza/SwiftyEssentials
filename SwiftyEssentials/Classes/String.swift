//
//  String.swift
//  SwiftyEssentials
//
//  Created by Josue Meza Peña on 12-03-18.
//

import UIKit

public extension String {
    
    // MARK: - Subscripts
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[Range(start ..< end)])
    }
    
    // MARK: - Attributes
    
    /**
     **nsstring**
     
     Return a NSString representation of the string.
     */
    var nsstring: NSString {
        get { return self as NSString }
    }
    
    /**
     **capitalizingFirstLetter**
     
     Capitalize only first character from string.
     */
    var capitalizingFirstLetter: String {
        get {
            return prefix(1).uppercased() + dropFirst()
        }
    }
    
    /**
     **stringByDeletingPathExtension**
     
     Remove extension path of string path representation.
     */
    var stringByDeletingPathExtension: String {
        get { return (self as NSString).deletingPathExtension }
    }
    
    /**
     **lastPathComponent**
     
     Last component of path representation.
     */
    var lastPathComponent: String {
        get { return (self as NSString).lastPathComponent }
    }
    
    // MARK: - Methods
    
    /**
     **nsrange**
     
     Obtains a NSRange required for NSAttributedString.
     
     - Parameter text: A text to search.
     
     - Returns: A NSRange of text.
     */
    func nsrange(of text: String) -> NSRange? {
        if let range = self.range(of: text) {
            return NSRange(range, in: self)
        }
        return nil
    }
}
