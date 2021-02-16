//
//  EventStore.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import EventKit

class EventStore {
    static let store = EKEventStore()
    
    static func authorize(completion: @escaping (Bool, Error?) -> Void) {
        store.requestAccess(to: .event, completion: completion)
    }
    
    static func events(after date: Date = Date()) -> [EKEvent]? {
        let predicate = store.predicateForEvents(withStart: date, end: date.endOfDay(), calendars: nil)
        let events = store.events(matching: predicate)
        return events.filter { $0.startDate > date }
    }
    
    static func currentOrPastEvent(after date: Date = Date()) -> EKEvent? {
        let predicate = store.predicateForEvents(withStart: date.startOfDay(), end: date, calendars: nil)
        let events = store.events(matching: predicate)
        return events.last
    }
}
