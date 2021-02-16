//
//  EventView.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI
import EventKit

struct EventView: View {
    let event: EKEvent
    let reload: () -> Void
    
    init(_ event: EKEvent, reload: @escaping () -> Void) {
        self.event = event
        self.reload = reload
    }
    
    var body: some View {
        VStack {
            EventTimer(
                start: event.startDate,
                reload: reload
            )
            EventRow(
                color: Color(event.calendar.cgColor),
                end: event.endDate,
                location: event.location,
                start: event.startDate,
                title: event.title
            )
        }
    }
}
