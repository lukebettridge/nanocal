//
//  ComplicationTimer.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 14/02/2021.
//

import SwiftUI

enum ComplicationTimerStyle {
    case large, small
}

struct ComplicationTimer: View {
    let date: Date
    let currentDate: Date
    let style: ComplicationTimerStyle
    
    var body: some View {
        switch style {
            case .large:
                ComplicationTimerLarge(date: date)
            case .small:
                ComplicationTimerSmall(date: date, currentDate: currentDate)
        }
    }
}
