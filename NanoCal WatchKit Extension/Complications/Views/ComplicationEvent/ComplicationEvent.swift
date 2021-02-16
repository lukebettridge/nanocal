//
//  ComplicationEvent.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI
import EventKit

struct ComplicationEvent: View {
    let event: EKEvent
    
    init(_ event: EKEvent) {
        self.event = event
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.caption2)
                    .lineLimit(1)
            }
            Spacer()
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 15)
        .overlay(
            HStack {
                Rectangle()
                    .fill(Color(event.calendar?.cgColor ?? CGColor(gray: 0, alpha: 0)))
                    .frame(width: 5)
                Spacer()
            }
        )
        .background(Color.gray.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
