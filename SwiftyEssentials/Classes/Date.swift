//
//  Date.swift
//  Pods
//
//  Created by Josue Meza Peña on 12-03-18.
//

import Foundation

public extension Date {
    
    // MARK: - Generated attributes
    
    /// Date year component.
    var year: Int { get { return Calendar.current.component(.year, from: self) } }
    /// Date month component.
    var month: Int { get { return Calendar.current.component(.month, from: self) } }
    /// Date day component.
    var day: Int { get { return Calendar.current.component(.day, from: self) } }
    /// Date hour component.
    var hour: Int { get { return Calendar.current.component(.hour, from: self) } }
    /// Date minute component.
    var minute: Int { get { return Calendar.current.component(.minute, from: self) } }
    /// Date second component.
    var second: Int { get { return Calendar.current.component(.second, from: self) } }
    /// True if the date is today.
    var isToday: Bool { get { return self.string(format: "yyyy-MM-dd") == Date.now().string(format: "yyyy-MM-dd") } }
    /// True if the date was yesterday.
    var isYesterday: Bool {
        get {
            let yesterday = Date.subtract(days: 1, to: Date.now())!
            return self.string(format: "yyyy-MM-dd") == yesterday.string(format: "yyyy-MM-dd")
        }
    }
    
    // MARK: - Class functions
    
    /**
     **Parse**
     
     Parse a string with format in a Date object.
     
     - Parameter stringDate: String with the date.
     - Parameter format: Format of string date.
     - Returns: A date representation of string interpreted by the parameter format.
     */
    static func parse(stringDate: String, format: String, fromTimeZone: String = TimeZone.current.abbreviation() ?? "GMT", toTimeZone: String? = nil) -> Date? {
        // Generate date from string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(identifier: fromTimeZone)
        let date = dateFormatter.date(from: stringDate)
        // Convert to destination timezone
        if let strictToTimeZone = toTimeZone {
            dateFormatter.timeZone = TimeZone(identifier: strictToTimeZone)
            return Date.parse(stringDate: dateFormatter.string(from: date!), format: format, fromTimeZone: strictToTimeZone)
        }
        return date
    }
    
    /**
     **Now**
     
     Generate a Date object with now values.
     
     - Parameter withTime: **Default: false.** Include now time velues in the Date object.
     - Returns: A date representation with now values.
     */
    static func now(withTime: Bool = false) -> Date {
        if withTime {
            return Date()
        }
        let strDate = Date().string(format: "yyyy-MM-dd Z")
        return Date.parse(stringDate: strDate, format: "yyyy-MM-dd Z")!
    }
    
    /**
     **add**
     
     Add parameter days to the parameter date.
     
     - Parameter days: Days to add.
     - Parameter date: Base date to increase.
     - Returns: Increased date.
     */
    static func add(days: Int, to date: Date) -> Date? {
        var components = DateComponents()
        components.day = days
        return Calendar.current.date(byAdding: components, to: date)
    }
    
    /**
     **add**
     
     Add parameter months to the parameter date.
     
     - Parameter months: Months to add.
     - Parameter date: Base date to increase.
     - Returns: Increased date.
     */
    static func add(months: Int, to date: Date) -> Date? {
        var components = DateComponents()
        components.month = months
        return Calendar.current.date(byAdding: components, to: date)
    }
    
    /**
     **add**
     
     Add parameter year to the parameter date.
     
     - Parameter years: Years to add.
     - Parameter date: Base date to increase.
     - Returns: Increased date.
     */
    static func add(years: Int, to date: Date) -> Date? {
        var components = DateComponents()
        components.year = years
        return Calendar.current.date(byAdding: components, to: date)
    }
    
    /**
     **subtract**
     
     Subtract parameter days to the parameter date.
     
     - Parameter days: Days to add.
     - Parameter date: Base date to increase.
     - Returns: Increased date.
     */
    static func subtract(days: Int, to date: Date) -> Date? {
        var components = DateComponents()
        components.day = -1 * days
        return Calendar.current.date(byAdding: components, to: date)
    }
    
    /**
     **subtract**
     
     Subtract parameter months to the parameter date.
     
     - Parameter month: Months to add.
     - Parameter date: Base date to increase.
     - Returns: Increased date.
     */
    static func subtract(months: Int, to date: Date) -> Date? {
        var components = DateComponents()
        components.month = -1 * months
        return Calendar.current.date(byAdding: components, to: date)
    }
    
    /**
     **subtract**
     
     Subtract parameter year to the parameter date.
     
     - Parameter year: Years to add.
     - Parameter date: Base date to increase.
     - Returns: Increased date.
     */
    static func subtract(years: Int, to date: Date) -> Date? {
        var components = DateComponents()
        components.year = -1 * years
        return Calendar.current.date(byAdding: components, to: date)
    }
    
    /**
     **fromTimestamp**
     
     Create a date from a timestamp int value.
     
     - Parameter timestamp: Timestamp value
     - Returns: Date representation created from timestamp.
     */
    static func fromTimestamp(timestamp inTimestamp: Int64) -> Date? {
        let timestamp = Double(inTimestamp) / 1000.0
        return NSDate(timeIntervalSince1970: timestamp) as Date
    }
    
    // MARK: - Methods
    
    /**
     **string**
     
     Generate a string representation of the date with the parameter format.
     
     - Parameter format: String with the date format to export.
     - Returns: A string representation of the date object.
     */
    func string(format: String, locale: String = Locale.current.identifier, withTimezone timezone: String = TimeZone.current.identifier) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(identifier: timezone)
        dateFormatter.locale = Locale(identifier: locale)
        return dateFormatter.string(from: self)
    }
    
    /**
     **isLaterThan**
     
     Compare the date object with the parameter date.
     
     - Parameter date: Date to compare.
     - Returns: True if the date is later than the parameter date.
     */
    func isLaterThan(_ date: Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedDescending
    }
    
    /**
     **isEarlierThan**
     
     Compare the date object with the parameter date.
     
     - Parameter date: Date to compare.
     - Returns: True if the date is earlier than the parameter date.
     */
    func isEarlierThan(_ date: Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedAscending
    }
    
    /**
     **isEqualThan**
     
     Compare the date object with the parameter date.
     
     - Parameter date: Date to compare.
     - Returns: True if the date is equal than the parameter date.
     */
    func isEqualThan(_ date: Date) -> Bool {
        return self.compare(date) == ComparisonResult.orderedSame
    }
    
}
