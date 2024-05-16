//
//  Builder.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 14.05.2024.
//

import UIKit

protocol BuilderProtocol{
    static func getMainMenuController() -> UIViewController
    static func createTabBarController() -> UIViewController
    
    //MARK: ViewControllers
    static func createMainMenuController() -> UIViewController
    static func createBasketController() -> UIViewController

}

class Builder: BuilderProtocol {
    
    static func getMainMenuController() -> UIViewController {
        MainMenuView()
    }
    
    static func createTabBarController() -> UIViewController {
        let tabBarView = TabBarView()
        let presenter = TabBarViewPresenter(view: tabBarView)
        tabBarView.presenter = presenter
        
        return tabBarView
    }
    
    
    
    static func createMainMenuController() -> UIViewController {
        let mainMenuView = MainMenuView()
        let presenter = MainMenuPresenter(view: mainMenuView)
        mainMenuView.presenter = presenter
        
        return UINavigationController(rootViewController: mainMenuView)
    }
    
    static func createBasketController() -> UIViewController {
        let basketView = BasketView()
        
        return basketView
    }
}
