//
//  ProductsSnapshot.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 07..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import Foundation
import Firebase

struct ProductsSnapshot{
    let products: [Product]
    
    init?(snapshot: DataSnapshot){
        guard let snapDict = snapshot.value as? [String:[String:Any]] else {
            return nil
        }
        var products = [Product]()
        for snap in snapDict{
            guard let product = Product(valueDict: snap.value) else {
                continue
            }
            products.append(product)
        }
        self.products = products
    }
}
