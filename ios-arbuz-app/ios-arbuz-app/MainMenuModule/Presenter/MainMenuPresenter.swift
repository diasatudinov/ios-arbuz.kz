//
//  MainMenuPresenter.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 14.05.2024.
//

import UIKit

protocol MainMenuPresenterProtocol: AnyObject {
    init(view: MainMenuViewProtocol)
    var datas: [MenuItem]? {get set}
    func getData()
}

class MainMenuPresenter {
    weak var view: MainMenuViewProtocol?
    var datas: [MenuItem]?
    required init(view: MainMenuViewProtocol) {
        self.view = view
        getData()
    }
}

extension MainMenuPresenter: MainMenuPresenterProtocol {
    func getData() {
        self.datas = PositionData.getMockData()
        view?.showData()
    }
}
