//
//  ComplicationTemplateModularLargeColumns.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 15/02/2021.
//

import ClockKit
import EventKit

extension ComplicationController {
    func makeComplicationTemplateModularLargeColumns(
        event: EKEvent?,
        prev: EKEvent?,
        date: Date
    ) -> CLKComplicationTemplateModularLargeColumns {
        let currentLabel = CLKTextProvider(format: prev?.endDate ?? date > date ? "CURR" : "PREV")
        if let prev = prev {
            currentLabel.tintColor = UIColor(cgColor: prev.calendar.cgColor)
        }
        let nextLabel = CLKTextProvider(format: "NEXT")
        if let event = event {
            nextLabel.tintColor = UIColor(cgColor: event.calendar.cgColor)
        }
        return CLKComplicationTemplateModularLargeColumns(
            row1Column1TextProvider: currentLabel,
            row1Column2TextProvider: CLKTextProvider(format: prev?.title ?? "N/A"),
            row2Column1TextProvider: nextLabel,
            row2Column2TextProvider: CLKTextProvider(format: event?.title ?? "N/A"),
            row3Column1TextProvider: CLKTextProvider(format: "TIME"),
            row3Column2TextProvider: event != nil
                ? CLKRelativeDateTextProvider(
                    date: event!.startDate,
                    relativeTo: date,
                    style: .natural,
                    units: .minute
                )
                : CLKTextProvider(format: "?")
        )
    }
}
