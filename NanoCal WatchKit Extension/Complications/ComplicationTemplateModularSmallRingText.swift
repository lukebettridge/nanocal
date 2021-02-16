//
//  ComplicationTemplateModularSmallRingText.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 15/02/2021.
//

import ClockKit
import EventKit

extension ComplicationController {
    func makeComplicationTemplateModularSmallRingText(
        event: EKEvent?,
        date: Date
    ) -> CLKComplicationTemplateModularSmallRingText {
        let minutesUntil = event != nil ? Double(event!.startDate - date) / 60 : 0.0
        let complication = CLKComplicationTemplateModularSmallRingText(
            textProvider: event != nil
                ? CLKRelativeDateTextProvider(
                    date: event!.startDate,
                    relativeTo: date,
                    style: .natural,
                    units: minutesUntil > 60 ? .hour : .minute
                )
                : CLKTextProvider(format: "?"),
            fillFraction: minutesUntil > 60 ? 1.0 : Float(minutesUntil) / 60,
            ringStyle: .closed
        )
        if let event = event {
            complication.tintColor = UIColor(cgColor: event.calendar.cgColor)
        }
        return complication
    }
}
