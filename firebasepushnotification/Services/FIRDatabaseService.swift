//
//  FIRDatabaseService.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 07..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import Firebase

enum FIRDatabaseReference: String{
    case products = "products"
}

class FIRDatabaseService{
    static let instance = FIRDatabaseService()
    
    //Referencia
    func reference(_ databaseReference: FIRDatabaseReference)->DatabaseReference{
        return Database.database().reference().child( databaseReference.rawValue)
    }
    //Snapshotok lekérése
    func observe(_ databaseReference: FIRDatabaseReference, completion: @escaping (DataSnapshot)-> Void){
        reference(databaseReference).observe(.value) { (snapshot) in
            completion(snapshot)
        }
    }
    //Postolni az adatbázisba
    func post(parameters: [String:Any], databaseReference: FIRDatabaseReference){
        reference(databaseReference).childByAutoId().setValue(parameters)
    }
}
