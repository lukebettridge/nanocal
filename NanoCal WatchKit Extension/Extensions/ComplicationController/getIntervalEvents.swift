//
//  ComplicationController.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 15/02/2021.
//

import ClockKit
import EventKit

extension ComplicationController {
    func getIntervalEvents(
        date: Date,
        complication: CLKComplication
    ) -> [CLKComplicationTimelineEntry] {
        let events = EventStore.events(after: date)
        
        var currentDate = date
        var entries: [CLKComplicationTimelineEntry] = []
        
        while currentDate.compare(date.endOfDay()) == .orderedAscending {
            let prev = EventStore.currentOrPastEvent(after: currentDate)
            let event = events?.first(where: { $0.startDate > currentDate })
            if let template = makeTemplate(for: event, with: prev, at: currentDate, complication: complication) {
                let entry = CLKComplicationTimelineEntry(
                    date: currentDate,
                    complicationTemplate: template
                )
                entries.append(entry)
            }
            currentDate = currentDate.addingTimeInterval(10.0 * 60.0)
        }
        return entries
    }
}
