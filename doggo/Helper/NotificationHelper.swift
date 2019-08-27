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
    
    func scheduleTimedNotification(data: NotificationData, isActionable: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = data.title
        notificationContent.body = data.content
        notificationContent.sound = UNNotificationSound.default
        notificationContent.badge = 1
        
        if isActionable {
            let categoryIdentifier = "Okay"
            
            notificationContent.categoryIdentifier = categoryIdentifier
            let okayAction = UNNotificationAction(identifier: "okay", title: "Okay", options: [])
            let remindLaterAction = UNNotificationAction(identifier: "remindLater", title: "Remind Me Later", options: [.destructive])
            let category = UNNotificationCategory(identifier: categoryIdentifier,
                                                  actions: [okayAction, remindLaterAction],
                                                  intentIdentifiers: [],
                                                  options: [])
            
            appDelegate.notificationCenter.setNotificationCategories([category])
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: data.duration!, repeats: data.isRepeating!)
        let identifier = "Local Notifications"
        let request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: trigger)
        
        appDelegate.notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error : \(error.localizedDescription)")
            }
        }
        
    }
    
    func scheduleDateNotification(data: NotificationData, isDaily: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = data.title
        notificationContent.body = data.content
        notificationContent.sound = UNNotificationSound.default
        notificationContent.badge = 1
        
        let date = Date(timeIntervalSinceNow: 1)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute,.second,], from: date)
        let triggerWeekly = Calendar.current.dateComponents([.weekday, .hour, .minute, .second,], from: date)
        var trigger:UNCalendarNotificationTrigger
        if isDaily {
            trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        }
        else {
            trigger = UNCalendarNotificationTrigger(dateMatching: triggerWeekly, repeats: true)
        }
        
        let identifier = "Local Notifications"
        let request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: trigger)
        print("HERE")
        appDelegate.notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error : \(error.localizedDescription)")
            }
        }
        
    }
}
