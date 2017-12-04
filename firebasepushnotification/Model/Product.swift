//
//  Product.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 04..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import Foundation
struct Product{
    let title: String
    let cost: Double
 
    init(title: String, cost: Double) {
        self.title = title
        self.cost = cost
    }
    
    func price() -> String {
        let costString = String(format: "%.2f", cost)
        return "$" + costString
    }
    
}
