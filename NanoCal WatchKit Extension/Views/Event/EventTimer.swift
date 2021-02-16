//
//  EventTimer.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI

struct EventTimer: View {
    @State var currentDate = Date()
    
    let start: Date
    let reload: () -> Void
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var seconds: Int {
        Int(start - currentDate)
    }
    
    var timeRemaining: String {
        let (h, m, s) = (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        if h > 0 { return "\(h) hr\(h != 1 ? "s" : "") \(m) min\(m != 1 ? "s" : "")" }
        else if m > 0 { return "\(m) minute\(m != 1 ? "s" : "")" }
        else { return "\(s) second\(s != 1 ? "s" : "")" }
    }
    
    var secondsRemaining: String {
        let s = (seconds % 3600) % 60
        return "\(s) sec\(s != 1 ? "s" : "")"
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Next event begins in")
                    .font(.footnote)
                    .foregroundColor(Color.gray.opacity(0.6))
                HStack(alignment: .lastTextBaseline, spacing: 5) {
                    Text(timeRemaining)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    if !timeRemaining.contains("seconds") {
                        Text(secondsRemaining)
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                }
            }
            Spacer()
        }
        .onReceive(timer) { input in
            if Int(start - input) < 0 { self.reload() }
            currentDate = input
        }
    }
}

struct EventTimer_Previews: PreviewProvider {
    static var previews: some View {
        EventTimer(start: Date(timeIntervalSinceNow: 3599), reload: { })
    }
}
