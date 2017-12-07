//
//  ViewController.swift
//  firebasepushnotification
//
//  Created by Velkei Miklós on 2017. 12. 03..
//  Copyright © 2017. NeonatCore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        ProductsService.instance.delegate = self
        ProductsService.instance.observeProducts()
//        FIRDatabaseService.instance.observe(.products) { (snapshot) in
//            guard let productSnapshot = ProductsSnapshot(snapshot: snapshot) else{
//                return
//            }
//            print(productSnapshot)
//        }
        
    }
    @IBAction func subscribeBtnWasPressed(_ sender: Any) {
        AlertServices.subscribeAlert(in: self)
    }
    
    
    @IBAction func addProductBtnWasPressed(_ sender: Any) {
        AlertServices.addProductAlert(in: self) { (product) in
            ProductsService.instance.post(product: product)
        }
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCell else { return UICollectionViewCell() }
        let product = products[indexPath.item]
        cell.configureCell(product: product)
        return cell
    }
}
extension ViewController: ProductsServiceDelegate{
    func didChange(products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
    
    
}
