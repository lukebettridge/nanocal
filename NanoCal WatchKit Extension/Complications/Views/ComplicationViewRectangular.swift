//
//  ComplicationViewRectangular.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI
import ClockKit
import EventKit

struct ComplicationViewRectangular: View {
    let event: EKEvent?
    let date: Date
    
    var body: some View {
        if let event = event {
            VStack {
                ComplicationTimer(
                    date: event.startDate,
                    currentDate: date,
                    style: .large
                )
                ComplicationEvent(event)
            }
        } else {
            EventEmpty()
        }
    }
}

struct ComplicationViewRectangular_Previews: PreviewProvider {
    static let event = EKEvent.mock([
        .color: CGColor(red: 1, green: 0, blue: 0, alpha: 1),
        .startDate: Date().addingTimeInterval(950),
        .title: "Piano Practice"
    ])
    
    static var previews: some View {
        CLKComplicationTemplateGraphicRectangularFullView(
            ComplicationViewRectangular(event: event, date: Date())
        ).previewContext()
    }
}
