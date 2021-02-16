//
//  DateView.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI

struct DateView: View {
    let currentDate = Date()
    
    var body: some View {
        HStack(spacing: 7.5) {
            if let day = currentDate.get(.day) {
                Text("\(day)")
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color.red)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                if let weekday = currentDate.weekday() { 
                    Text(weekday)
                        .foregroundColor(.red)
                }
                if let month = currentDate.month(.full), let year = currentDate.get(.year) {
                    Text("\(month) \(String(year))")
                }
            }
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
