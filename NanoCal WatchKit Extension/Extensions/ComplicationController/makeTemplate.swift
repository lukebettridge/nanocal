//
//  makeTemplate.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 15/02/2021.
//

import SwiftUI
import ClockKit
import EventKit

extension ComplicationController {
    func makeTemplate(for event: EKEvent?, with prev: EKEvent?, at date: Date, complication: CLKComplication) -> CLKComplicationTemplate? {
        switch complication.family {
            case .modularLarge:
                return makeComplicationTemplateModularLargeColumns(
                    event: event,
                    prev: prev,
                    date: date
                )
            case .modularSmall:
                return makeComplicationTemplateModularSmallRingText(
                    event: event,
                    date: date
                )
            case .graphicCircular:
                return CLKComplicationTemplateGraphicCircularView(
                    ComplicationViewCircular(event: event, date: date)
                )
            case .graphicRectangular:
                  return CLKComplicationTemplateGraphicRectangularFullView(
                    ComplicationViewRectangular(event: event, date: date)
                  )
            case .utilitarianLarge:
                return makeComplicationTemplateUtilitarianLargeFlat(
                    event: event,
                    date: date
                )
            default:
              return nil
        }
    }
}
