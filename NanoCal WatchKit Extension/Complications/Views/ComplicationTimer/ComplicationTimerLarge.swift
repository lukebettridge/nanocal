//
//  ComplicationTimerLarge.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI

struct ComplicationTimerLarge: View {
    let date: Date
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Next event begins in")
                    .font(.footnote)
                    .foregroundColor(Color.gray.opacity(0.6))
                Text(date, style: .relative)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
            }
            Spacer()
        }
    }
}

struct ComplicationTimerLarge_Previews: PreviewProvider {
    static var previews: some View {
        ComplicationTimerLarge(date: Date())
    }
}
