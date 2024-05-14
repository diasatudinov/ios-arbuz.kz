//
//  MainMenuPresenter.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 14.05.2024.
//

import UIKit

protocol MainMenuPresenterProtocol: AnyObject {
    init(view: MainMenuViewProtocol)
    func getPositions()
}

class MainMenuPresenter {
    weak var view: MainMenuViewProtocol?
    required init(view: MainMenuViewProtocol) {
        self.view = view
        getPositions()
    }
}

extension MainMenuPresenter: MainMenuPresenterProtocol {
    func getPositions() {
//        self.positions = PositionData.getMockData()
        view?.showPositions()
    }
}
