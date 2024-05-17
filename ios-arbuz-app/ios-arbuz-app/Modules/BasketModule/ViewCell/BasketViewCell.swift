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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHostingController()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHostingController()
    }
    
    private func setupHostingController() {
        let basketUIViewCell = BasketUIViewCell()
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
