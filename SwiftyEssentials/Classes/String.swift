//
//  String.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
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
     **encodeForEmoji**
     
     Encode emojis on the string.
     */
    var encodeForEmoji: String {
        if let encodeStr = NSString(cString: self.cString(using: .nonLossyASCII)!, encoding: String.Encoding.utf8.rawValue){
            return encodeStr as String
        }
        return self
    }
    
    /**
     **decodeForEmoji**
     
     Decode emojis on the string.
     */
    var decodeForEmoji: String{
        let data = self.data(using: String.Encoding.utf8);
        let decodedStr = NSString(data: data!, encoding: String.Encoding.nonLossyASCII.rawValue)
        if let str = decodedStr{
            return str as String
        }
        return self
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
    
    // MARK: - Class functions
    
    /// :nodoc:
    @available(*, deprecated)
    static func stringFromBundleFile(_ file: String, ofType type: String) -> NSString? {
        if let filePath = Bundle.main.path(forResource: file, ofType: type) {
            if let text = (try? NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue)) {
                return text
            }
        }
        return nil
    }
    
    // MARK: - Methods
    
    /// :nodoc:
    @available(*, deprecated)
    func splitBySeparator(_ separator: Character) -> [String] {
        return self.characters.split{$0 == separator}.map(String.init)
    }
    
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
