//
//  NotificationHelper.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationHelper {
    
    func scheduleTimedNotification(data: NotificationData, isActionable: Bool, date: Date) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = data.title
        notificationContent.body = data.content
        notificationContent.sound = UNNotificationSound.default
        notificationContent.badge = 1
        
        if isActionable {
            let categoryIdentifier = data.title
            
            notificationContent.categoryIdentifier = categoryIdentifier
            let okayAction = UNNotificationAction(identifier: data.title, title: "Okay", options: [])
            let remindLaterAction = UNNotificationAction(identifier: "remindLater", title: "Remind Me Later", options: [.destructive])
            let category = UNNotificationCategory(identifier: categoryIdentifier,
                                                  actions: [okayAction, remindLaterAction],
                                                  intentIdentifiers: [],
                                                  options: [])
            
            appDelegate.notificationCenter.setNotificationCategories([category])
        }
        
        let currentDate = Date()
        
        let notificationTime = date.timeIntervalSince1970 - currentDate.timeIntervalSince1970
        print("S \(notificationTime)")
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notificationTime, repeats: data.isRepeating!)
        let identifier = "Local Notifications"
        let request = UNNotificationRequest(identifier: data.title, content: notificationContent, trigger: trigger)
        
        appDelegate.notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error : \(error.localizedDescription)")
            }
        }
        
    }
}
