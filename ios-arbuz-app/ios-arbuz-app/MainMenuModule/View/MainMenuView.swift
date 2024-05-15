//
//  MainMenuView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 14.05.2024.
//

import UIKit
import SwiftUI

protocol MainMenuViewProtocol: AnyObject {
    func showData()
    
}

class MainMenuView: UIViewController, ViewTodayHostable {

    
    var presenter: MainMenuPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        if let items = presenter.datas{
            self.add(hostableView: MainMenuUIView(items: items))
        }
        
    }

}

extension MainMenuView: MainMenuViewProtocol {
    func showData() {
        
    }
    
}

class MainMenuCELLView: UIViewController, ViewTodayHostable {

    
    var presenter: MainMenuPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.add(hostableView: ProductCellUIView())
    }

}
