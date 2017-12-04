//
//  AlertService.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 04..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import UIKit
class AlertServices{
    
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping (Product)-> Void){
        
        let alertController = UIAlertController(title: "Add New Product", message: "What's for sale?", preferredStyle: UIAlertControllerStyle.alert)
        
        //TextFieldek
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Title"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Price"
            textField.keyboardType = .numberPad
        }
        
        //Hozzá kell adni
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.default, handler: {
            alert -> Void in
            
            guard let title = alertController.textFields?.first?.text,
                let price = alertController.textFields?.last?.text,
                let cost = Double(price)
                else {
                    return
            }
            
            let product = Product(title: title, cost: cost)
            completion(product)
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in
            vc.dismiss(animated: true, completion: nil)
        })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func subscribeAlert(in vc: UIViewController){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "Subscribe", style: .default) { (_) in

        }
        let unSubscribe = UIAlertAction(title: "Unsubscribe", style: .default) { (_) in

        }
        alert.addAction(subscribe)
        alert.addAction(unSubscribe)
        vc.present(alert, animated: true)
    }
    
}
