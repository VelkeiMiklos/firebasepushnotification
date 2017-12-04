//
//  UNServices.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 04..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import UIKit
import UserNotifications
class UNService: NSObject{
    static let instance = UNService()
    let unCenter = UNUserNotificationCenter.current()
    
    
    func authorize(){
        let options: UNAuthorizationOptions = [.alert, .sound]
        unCenter.requestAuthorization(options: options) { (granted, error) in
            print( error ?? "no un autharization error" )
            guard granted else{
                return
            }
            DispatchQueue.main.async {
                self.configure()
            }
        }
    }
    func configure(){
        unCenter.delegate = self
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
    }
}
extension UNService: UNUserNotificationCenterDelegate{
    //background
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("un did recieved")
        
        completionHandler()
    }
    //foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("un will present")
        
        let options: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(options)
        
    }
    
    
}
