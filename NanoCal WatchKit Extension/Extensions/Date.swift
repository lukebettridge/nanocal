//
//  Date.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import Foundation

enum MonthFormat {
    case single, double, abbreviated, full
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func startOfDay() -> Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: self)
    }
    
    func endOfDay() -> Date {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: self)
        
        var endOfDayComponents = DateComponents()
        endOfDayComponents.day = 1
        endOfDayComponents.minute = -1
        return calendar.date(byAdding: endOfDayComponents, to: startOfDay)!
    }
    
    func month(_ format: MonthFormat = .full) -> String? {
        let dateFormatter = DateFormatter()
        
        switch format {
            case .single:
                dateFormatter.dateFormat = "M"
                break
            case .double:
                dateFormatter.dateFormat = "MM"
                break
            case .abbreviated:
                dateFormatter.dateFormat = "MMM"
                break
            case .full:
                dateFormatter.dateFormat = "MMMM"
                break
        }
        return dateFormatter.string(from: self)
    }
    
    func time() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    func weekday() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
