//
//  EKEvent.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 14/02/2021.
//

import EventKit

enum EKEventMockKey {
    case color, endDate, startDate, title
}

extension EKEvent {
    static func mock(_ data: [EKEventMockKey: Any]) -> EKEvent {
        let calendar = EKCalendar(for: .event, eventStore: EKEventStore())
        let event = EKEvent(eventStore: EKEventStore())
        
        if let color = data[.color] {
            calendar.cgColor = (color as! CGColor)
        }
        
        event.endDate = data[.endDate] as? Date ?? Date()
        event.startDate = data[.startDate] as? Date ?? Date()
        event.title = data[.title] as? String ?? ""
        event.calendar = calendar
        
        return event
    }
}
