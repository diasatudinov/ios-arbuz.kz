//
//  ProductDetailsView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 16.05.2024.
//

import UIKit
import SwiftUI

class ProductDetailsView: UIViewController, ViewTodayHostable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        //self.add(hostableView: ProductDetailsUIView())
        
        
    }
    
    public func setup(image: String, name: String, description: String, additionalDescription: String, storageConditions: String, country: String, price: Int, minQuantity: Double, minQuantityText: String) {
        
        self.add(hostableView: ProductDetailsUIView(image: image, name: name, description: description, additionalDescription: additionalDescription, country: country, storageConditions: storageConditions, price: price, minQuantity: minQuantity, minQuantityText: minQuantityText))
        //self.addFeel(hostableView: SourcesViewTextOne(image: image, group: group))
    }
    
}
