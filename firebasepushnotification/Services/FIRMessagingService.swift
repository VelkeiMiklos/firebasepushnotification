//
//  FIRMessagingService.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 07..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import Foundation
import FirebaseMessaging


enum SubscriptionTopic: String{
    case newProducts = "newProducts"
}


class FIRMessagingService{
    static let instance = FIRMessagingService()
    
    let messaging = Messaging.messaging()
    
    
    func subscribe(topic: SubscriptionTopic){
        messaging.subscribe(toTopic: topic.rawValue)
    }
    func unsubscribe(topic: SubscriptionTopic){
        messaging.unsubscribe(fromTopic: topic.rawValue)
    }
    
}
