//
//  BasketManager.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 17.05.2024.
//

import SwiftUI

class BasketManager: ObservableObject {
    @Published var items: [MenuItem] = []
    
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
            items.remove(at: index)
            
        }
    }
    
    func clearCart() {
        items.removeAll()
    }
}
