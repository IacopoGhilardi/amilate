//
//  DateUtils.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 29/03/2026.
//
import Foundation

struct DateUtils {
    
    static let timeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "HH:mm"
        return f
    }()
    
    static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "dd/MM/yyyy"
        f.locale = Locale(identifier: "it_IT")
        return f
    }()
    
    static let fullFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "dd MMMM yyyy"
        f.locale = Locale(identifier: "it_IT")
        return f
    }()
    
    static func timeString(from date: Date) -> String {
        return timeFormatter.string(from: date)
    }
    
    static func dateString(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    static func fullDateString(from date: Date) -> String {
        return fullFormatter.string(from: date)
    }
}
