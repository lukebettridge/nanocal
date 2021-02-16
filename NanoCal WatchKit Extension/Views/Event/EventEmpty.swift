//
//  EventEmpty.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI

struct EventEmpty: View {
    var body: some View {
        HStack {
            Text("No upcoming events today.")
                .font(.caption)
                .foregroundColor(Color.gray.opacity(0.5))
                .lineLimit(2)
                .minimumScaleFactor(0.1)
            Spacer()
            Image(systemName: "calendar.badge.clock")
                .font(.title2)
                .foregroundColor(Color.gray.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .padding(.horizontal, 15)
        .background(Color.gray.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 7.5))
    }
}

struct EventEmpty_Previews: PreviewProvider {
    static var previews: some View {
        EventEmpty()
    }
}
