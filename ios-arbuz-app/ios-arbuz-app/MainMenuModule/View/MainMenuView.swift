//
//  MainMenuView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 14.05.2024.
//

import UIKit

protocol MainMenuViewProtocol: AnyObject {
    func showPositions()
}

class MainMenuView: UIViewController {

    
    var presenter: MainMenuPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainMenuView: MainMenuViewProtocol {
    func showPositions() {
    }
    
}
