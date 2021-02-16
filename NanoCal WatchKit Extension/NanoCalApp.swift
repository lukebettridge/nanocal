//
//  NanoCalApp.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 13/02/2021.
//

import SwiftUI
import Foundation

@main
struct NanoCalApp: App {
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self) var delegate
    
    init() {
        EventStore.authorize() { granted, error in }
    }
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
