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

final class TheAppRouter {
    
    enum DestinationIndividual {
        case custom(UIViewController)
        case home
        case tabBar
        case basket
    }
    
    enum TransitionTypeSingleApp {
        case change
        case push(animated: Bool)
        case present(animated: Bool)
    }
    
    // MARK: - Static
    
    static let shared = TheAppRouter()
    
    // MARK: - Variables
    
    public let navigationSuperController = UINavigationController()
    
    
    
    private var currentControllerName: String?
    
    // MARK: - Init
    
    private init() {
        self.navigationSuperController.navigationBar.isHidden = true
        self.navigationSuperController.isNavigationBarHidden = true
        
        let blankController = UIViewController()
        blankController.view.backgroundColor = UIColor(named: "background")
        self.move(to: .custom(blankController), type: .change)
       
        
        self.move(to: .tabBar, type: .change)
//
        
        
    }
    
    // MARK: - Methods
    
    
    func back() {
        DispatchQueue.main.async {
            self.navigationSuperController.popViewController(animated: true)
        }
    }
    
    func move(to destination: TheAppRouter.DestinationIndividual, type: TheAppRouter.TransitionTypeSingleApp) {
        var viewController: UIViewController? {
            switch destination {
            case .custom(let viewController):
                return viewController
                
                
            case .home:
                return MainMenuView()
                
            
            case .basket:
                return BasketView()
            case .tabBar:
                return Builder.createTabBarController()
            }
        
        }
        
        self.currentControllerName = self.controllerNameText(viewController)
        
        DispatchQueue.main.async {
            if let viewController {
                switch type {
                case .change:
                    self.navigationSuperController.setViewControllers([viewController], animated: false)
                case .push(let animated):
                    self.navigationSuperController.pushViewController(viewController, animated: animated)
                case .present(let animated):
                    self.navigationSuperController.present(viewController, animated: animated)
                }
            }
        }
        
        
    }
    
    private func controllerNameText(_ controller: UIViewController?) -> String? {
        if let subsequence = String(describing: controller).split(separator: ":").first,
           let result = subsequence.split(separator: "<").last
        {
            return String(result)
        } else {
            return nil
        }
    }
   
}
