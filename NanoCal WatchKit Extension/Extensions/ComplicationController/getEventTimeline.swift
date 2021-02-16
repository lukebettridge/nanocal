//
//  getEventTimeline.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 15/02/2021.
//

import ClockKit
import EventKit

extension ComplicationController {
    func getEventTimeline(
        date: Date,
        complication: CLKComplication
    ) -> [CLKComplicationTimelineEntry] {
        let events = EventStore.events(after: date)
        let prev = EventStore.currentOrPastEvent(after: date)
        
        var entries: [CLKComplicationTimelineEntry] = []
        
        if let events = events {
            for i in events.indices {
                let event = events[i]
                let next = events.count > i + 1 ? events[i + 1] : nil
                if let template = makeTemplate(for: next, with: prev, at: event.startDate, complication: complication) {
                    let entry = CLKComplicationTimelineEntry(
                        date: event.startDate,
                        complicationTemplate: template
                    )
                    entries.append(entry)
                }
            }
        }
        return entries
    }
}
