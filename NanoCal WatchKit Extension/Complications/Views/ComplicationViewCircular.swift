//
//  ComplicationViewCircular.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 14/02/2021.
//

import SwiftUI
import ClockKit
import EventKit

struct ComplicationViewCircular: View {
    let event: EKEvent?
    let date: Date
    
    var fraction: Double {
        if let event = event {
            let minutesUntil = Double(event.startDate - date) / 60
            return minutesUntil > 60 ? 1.0 : minutesUntil / 60
        } else {
            return 0.0
        }
    }
    
    var body: some View {
        if let event = event {
            ZStack {
                ComplicationTimer(
                    date: event.startDate,
                    currentDate: date,
                    style: .small
                )
                ProgressView(
                    value: fraction,
                    total: 1.0
                )
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(event.calendar.cgColor)))
            }
            .multilineTextAlignment(.center)
        } else {
            Image(systemName: "calendar.badge.clock")
                .font(.title3)
                .foregroundColor(Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray.opacity(0.25))
        }
    }
}

struct ComplicationViewCircular_Previews: PreviewProvider {
    static let event = EKEvent.mock([
        .color: CGColor(red: 1, green: 0, blue: 0, alpha: 1),
        .startDate: Date().addingTimeInterval(10801),
        .title: "Piano Practice"
    ])
    
    static var previews: some View {
        CLKComplicationTemplateGraphicCircularView(
            ComplicationViewCircular(event: event, date: Date())
        ).previewContext()
    }
}
