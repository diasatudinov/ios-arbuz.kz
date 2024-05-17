//
//  BasketViewCell.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 17.05.2024.
//

import UIKit
import SwiftUI


class BasketViewCell: UICollectionViewCell {
    
    private var hostingController: UIHostingController<BasketUIViewCell>?
    //let basketManager: BasketManager? = nil
    func setupHostingController(item: MenuItem, basketManager: BasketManager) {
        
        let basketUIViewCell = BasketUIViewCell(item: item, basketManager: basketManager)
        
        hostingController = UIHostingController(rootView: basketUIViewCell)
        
        
        guard let hostingController = hostingController else { return }
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    
    
}
