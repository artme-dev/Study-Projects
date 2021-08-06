//
//  NotificationAlert.swift
//  URLSession
//
//  Created by Артём on 30.07.2021.
//

import Foundation
import UserNotifications

class NotificationUtil{
    static func requestAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _,_ in }
    }
    
    static func pushNotification(with body: String){
        let content = UNMutableNotificationContent()
        content.title = "Important notification"
        content.body = body
        
        let request = UNNotificationRequest(identifier: "FileDownloadingComplete",
                                            content: content,
                                            trigger: nil)
        
        UNUserNotificationCenter.current().add(request,
                                               withCompletionHandler: nil)
    }
}
