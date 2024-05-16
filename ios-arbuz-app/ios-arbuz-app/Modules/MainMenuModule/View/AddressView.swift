//
//  AddressView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 16.05.2024.
//

import UIKit
import SwiftUI

class AddressView: UIViewController, ViewTodayHostable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        self.add(hostableView: AddressUIView())
        
        
    }
    
}
