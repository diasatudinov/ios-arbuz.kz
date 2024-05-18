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
    
    public func setup(item: MenuItem, basketManager: BasketManager) {
        
        self.add(hostableView: ProductDetailsUIView(item: item).environmentObject(basketManager))
        //self.addFeel(hostableView: SourcesViewTextOne(image: image, group: group))
    }
    
}
