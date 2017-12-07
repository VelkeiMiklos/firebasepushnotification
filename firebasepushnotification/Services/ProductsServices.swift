//
//  ProductsServices.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 07..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate {
    func didChange(products: [Product])
}


class ProductsService{
    static let instance = ProductsService()
    var delegate: ProductsServiceDelegate?
    
    func observeProducts(){
        FIRDatabaseService.instance.observe(.products) { (snapshot) in
            guard let productSnapshot = ProductsSnapshot(snapshot: snapshot) else  {
                return
            }
            self.delegate?.didChange(products: productSnapshot.products)
        }
    }
    
    
    func post(product: Product){
        FIRDatabaseService.instance.post(parameters: product.parameters(), databaseReference: .products)
    }
    
}
