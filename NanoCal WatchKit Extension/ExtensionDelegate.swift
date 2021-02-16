//
//  ExtensionDelegate.swift
//  NanoCal WatchKit Extension
//
//  Created by Luke Bettridge on 14/02/2021.
//

import Foundation
import WatchKit
import ClockKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {
    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        for task in backgroundTasks {
            print("received background task: ", task)
            // only handle these while running in the background
            if (WKExtension.shared().applicationState == .background) {
                if task is WKApplicationRefreshBackgroundTask {
                    reloadComplications()
                }
            }
            task.setTaskCompletedWithSnapshot(false)
            scheduleBackgroundRefresh()
        }
    }
    
    func applicationDidEnterBackground() {
        scheduleBackgroundRefresh()
    }
    
    private func reloadComplications() {
        let server = CLKComplicationServer.sharedInstance()
        for comp in server.activeComplications! {
            server.reloadTimeline(for: comp)
        }
    }
    
    private func scheduleBackgroundRefresh() {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        
        var endOfDayComponents = DateComponents()
        endOfDayComponents.day = 1
        endOfDayComponents.hour = 4
        let preferredDate = calendar.date(byAdding: endOfDayComponents, to: startOfDay)!
        
        WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: preferredDate, userInfo: nil) { error in
            guard error == nil else {
                return print("Couldn't schedule background refresh.")
            }
            print("Scheduled next background update task for: \(preferredDate)")
        }
    }
}
