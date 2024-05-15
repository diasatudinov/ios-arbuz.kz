//
//  MainMenuUIView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 15.05.2024.
//

import SwiftUI


struct MainMenuUIView: View {
    var items: [MenuItem]
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], spacing: 8) {
                    ForEach(items) { item in
                        VStack {
                            ProductCellUIView(image: item.image, name: item.name, additionalDescription: item.additionalDescription, price: item.price, minQuantity: item.minQuantity, minQuantityText: item.minQuantityText)
                                .frame(height: UIScreen.main.bounds.height/3.5)
                        }
                        
                    }
                }
                
            }
        }.padding(.horizontal,5)
    }
}

#Preview {
    MainMenuUIView(items: [])
}
