//
//  ProductCell.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 04..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var productLbl: UILabel!
    
    func configureCell(product: Product){
        self.productLbl.text = product.title
        self.titleLbl.text = product.price()
    }
    
}
