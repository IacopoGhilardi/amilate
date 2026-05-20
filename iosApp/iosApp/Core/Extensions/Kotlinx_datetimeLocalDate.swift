//
//  Kotlinx_datetimeLocalDate.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 29/03/2026.
//
import Shared
import Foundation

extension Kotlinx_datetimeLocalDate {
    var asDate: Date {
        var components = DateComponents()
        components.year = Int(self.year)
        components.month = Int(self.month.ordinal) + 1
        components.day = Int(self.day)
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var asString: String {
        return "\(self.day)/\(Int(self.month.ordinal) + 1)/\(self.year)"
    }
}

extension Kotlinx_datetimeLocalDateTime {
    var asDate: Date {
        var components = DateComponents()
        components.year = Int(self.year)
        components.month = Int(self.month.ordinal) + 1
        components.day = Int(self.day)
        components.hour = Int(self.hour)
        components.minute = Int(self.minute)
        components.second = Int(self.second)
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var asString: String {
        let h = String(format: "%02d", self.hour)
        let m = String(format: "%02d", self.minute)
        return "\(self.day)/\(Int(self.month.ordinal) + 1)/\(self.year) \(h):\(m)"
    }
}

extension Kotlinx_datetimeLocalTime {
    var asString: String {
        let h = String(format: "%02d", self.hour)
        let m = String(format: "%02d", self.minute)
        return "\(h):\(m)"
    }
    
    var asDateComponents: DateComponents {
        var components = DateComponents()
        components.hour = Int(self.hour)
        components.minute = Int(self.minute)
        components.second = Int(self.second)
        return components
    }
}

typealias LocalDate = Kotlinx_datetimeLocalDate
typealias LocalDateTime = Kotlinx_datetimeLocalDateTime
typealias LocalTime = Kotlinx_datetimeLocalTime
