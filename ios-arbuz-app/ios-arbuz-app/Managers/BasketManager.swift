//
//  BasketManager.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 17.05.2024.
//

import SwiftUI

protocol BasketDelegate: AnyObject {
    func reloadData()
}

class BasketManager: ObservableObject {
    @Published var items: [MenuItem] = []
    @Published var summa: Double = 0.0
        
    weak var delegate: BasketDelegate?
    
    func addToSumma(summa: Double) {
        self.summa += summa
        delegate?.reloadData()
    }
    
    func subFromSumma(summa: Double) {
        self.summa -= summa
        delegate?.reloadData()
    }
    
    func addItem(_ item: MenuItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].count += item.minQuantity
        } else {
            item.count = item.minQuantity
            items.append(item)
        }
    }
    
    func removeItem(_ item: MenuItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            if items[index].count > item.minQuantity {
                items[index].count -= item.minQuantity
            } else {
                item.count = 0
                items.remove(at: index)
            }
        }
    }
    
    func removeFullItem(_ item: MenuItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            //item.count = 0
            summa -= item.count * Double(item.price)
            items.remove(at: index)
            
        }
    }
    
    func clearCart() {
        summa = 0.0
        items.removeAll()
    }
}
