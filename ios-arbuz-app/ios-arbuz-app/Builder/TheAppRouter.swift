//
//  TheAppRouter.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 16.05.2024.
//

import UIKit


final class TheAppRouter {
    
    enum DestinationIndividual {
        case custom(UIViewController)
        case home
        case tabBar
        case basket
        case address
        case productDetails(image: String, name: String, description: String, additionalDescription: String, storageConditions: String, country: String, price: Int, minQuantity: Double, minQuantityText: String)
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
        
        
    }
    
    // MARK: - Methods
    
    
    func back() {
        DispatchQueue.main.async {
            self.navigationSuperController.popViewController(animated: true)
        }
    }
    
    func backFromSheet() {
        DispatchQueue.main.async {
            self.navigationSuperController.dismiss(animated: true)
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
            case .address:
                let vc = AddressView()
                if #available(iOS 15.0, *) {
                    if let sheet = vc.sheetPresentationController{
                        sheet.detents = [.medium()]
                    }
                    return vc
                } else {
                    // Fallback on earlier versions
                    return vc
                }

            case .productDetails(image: let image, name: let name, description: let description, additionalDescription: let additionalDescription, storageConditions: let storageConditions, country: let country, price: let price, minQuantity: let minQuantity, minQuantityText: let minQuantityText):
                let productDetailsVC = ProductDetailsView()
                productDetailsVC.setup(image: image, name: name, description: description, additionalDescription: additionalDescription, storageConditions: storageConditions, country: country, price: price, minQuantity: minQuantity, minQuantityText: minQuantityText)
                return productDetailsVC
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
