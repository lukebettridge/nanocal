//
//  ComplicationTemplateUtilitarianLargeFlat.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 15/02/2021.
//

import ClockKit
import EventKit

extension ComplicationController {
    func makeComplicationTemplateUtilitarianLargeFlat(
        event: EKEvent?,
        date: Date
    ) -> CLKComplicationTemplateUtilitarianLargeFlat {
        return CLKComplicationTemplateUtilitarianLargeFlat(
            textProvider: event != nil
                ? CLKTextProvider(format: "\(event!.title ?? "Next event") in %@", CLKRelativeDateTextProvider(
                                    date: event!.startDate,
                                    relativeTo: date,
                                    style: .natural,
                                    units: .minute
                    )
                )
                : CLKTextProvider(format: "No upcoming events today.")
        )
    }
}
