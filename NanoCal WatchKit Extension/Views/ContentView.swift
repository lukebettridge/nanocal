//
//  ContentView.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI
import ClockKit
import EventKit

struct ContentView: View {
    @State var event: EKEvent?
    let storeChanged = NotificationCenter.default.publisher(for: .EKEventStoreChanged)
    
    func fetchEvent() {
        self.event = EventStore.events()?.first
    }
    
    func reloadComplications() {
        let server = CLKComplicationServer.sharedInstance()
        for comp in server.activeComplications! {
            server.reloadTimeline(for: comp)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            DateView()

            Divider()
                .padding(.vertical)

            if let event = event {
                EventView(event, reload: fetchEvent)
            } else {
                EventEmpty()
            }
            
            Spacer()
        }
        .onAppear(perform: fetchEvent)
        .onReceive(storeChanged) { _ in
            fetchEvent()
            reloadComplications()
        }
    }
}
