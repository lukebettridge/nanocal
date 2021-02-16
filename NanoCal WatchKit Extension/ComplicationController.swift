//
//  ComplicationController.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI
import ClockKit
import EventKit

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Complication Configuration

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "What's Next", supportedFamilies: [.graphicCircular, .graphicRectangular, .modularSmall, .modularLarge, .utilitarianLarge])
        ]
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        let events = EventStore.events()
        handler(events?.last?.startDate)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        let currentDate = Date()
        let prev = EventStore.currentOrPastEvent()
        let event = EventStore.events()?.first
        if let template = makeTemplate(for: event, with: prev, at: currentDate, complication: complication) {
          let entry = CLKComplicationTimelineEntry(
            date: currentDate,
            complicationTemplate: template
          )
          handler(entry)
        } else {
          handler(nil)
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        var entries: [CLKComplicationTimelineEntry] = []
        
        entries.append(contentsOf: getEventTimeline(date: date, complication: complication))
        entries.append(contentsOf: getIntervalEvents(date: date, complication: complication))
        entries.sort() { $0.date.compare($1.date) == .orderedAscending }
        
        handler(entries)
    }

    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        let prev = EKEvent.mock([
            .color: CGColor(red: 0, green: 1, blue: 0.5, alpha: 0.5),
            .startDate: Date().addingTimeInterval(-50),
            .title: "Meeting"
        ])
        let event = EKEvent.mock([
            .color: CGColor(red: 0, green: 0.5, blue: 1, alpha: 0.5),
            .startDate: Date().addingTimeInterval(950),
            .title: "Piano Practice"
        ])
        if let template = makeTemplate(for: event, with: prev, at: Date(), complication: complication) {
          handler(template)
        } else {
          handler(nil)
        }
    }
}


