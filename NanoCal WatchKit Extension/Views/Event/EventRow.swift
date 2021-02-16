//
//  EventRow.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI

struct EventRow: View {
    let color: Color
    let end: Date
    let location: String?
    let start: Date
    let title: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if let end = end.time(), let start = start.time() {
                    Text("\(start) – \(end)")
                        .font(.footnote)
                        .foregroundColor(Color.gray.opacity(0.5))
                }
                Text(title)
                    .font(.caption2)
                    .lineLimit(1)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 5)
        .padding(.horizontal, 15)
        .overlay(
            HStack {
                Rectangle()
                    .fill(color)
                    .frame(width: 5)
                Spacer()
            }
        )
        .background(Color.gray.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 7.5))
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(
            color: .red,
            end: Date(),
            location: "Location",
            start: Date(),
            title: "Title"
        )
    }
}
