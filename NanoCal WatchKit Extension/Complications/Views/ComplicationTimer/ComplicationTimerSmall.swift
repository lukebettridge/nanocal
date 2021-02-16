//
//  ComplicationTimerSmall.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 14/02/2021.
//

import SwiftUI

struct ComplicationTimerSmall: View {
    let date: Date
    let currentDate: Date
    
    var body: some View {
        VStack {
            Group {
                if Int(date - currentDate) > 3599 {
                    Text(">\(Int(date - currentDate) / 3600)hr")
                } else {
                    Text(date, style: .timer)
                }
            }
            .font(.system(size: 10.5, weight: .semibold))
        }
    }
}

struct ComplicationTimerSmall_Previews: PreviewProvider {
    static var previews: some View {
        ComplicationTimerSmall(
            date: Date().addingTimeInterval(3601),
            currentDate: Date()
        )
    }
}
