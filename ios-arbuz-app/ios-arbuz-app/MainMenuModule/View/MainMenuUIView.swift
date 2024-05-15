//
//  MainMenuUIView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 15.05.2024.
//

import SwiftUI


struct MainMenuUIView: View {
    var items: [MenuItem]
    @State private var headerOffset: CGFloat = 0
    @State private var isHeaderHidden = false
    var body: some View {
        NavigationView {
            ScrollView{
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: OffsetKey.self, value: geometry.frame(in: .global).minY)
                        .onPreferenceChange(OffsetKey.self) { value in
                            withAnimation {
                                headerOffset = value
                                isHeaderHidden = value < -5 // Скрыть хэдер, если скролл больше -50
                            }
                        }
                }
                .frame(height: 0)
                
                VStack(alignment: .leading) {
                    if !isHeaderHidden {
                        Button {
                            
                        } label: {
                            MainHeaderView()
                                .frame(height: 100)
                                .offset(y: headerOffset < 0 ? headerOffset : 0)
                                .animation(.smooth)
                        }
                    }
                    Text("Новинки для Вас")
                        .font(.title3).bold()
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(items.reversed().prefix(6)) { item in
                                ProductCellUIView(image: item.image, name: item.name, additionalDescription: item.additionalDescription, price: item.price, minQuantity: item.minQuantity, minQuantityText: item.minQuantityText)
                                    .frame(height: UIScreen.main.bounds.height/3.5)
                            }
                        }
                    }
                    Text("для Friends")
                        .font(.title3).bold()
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], spacing: 8) {
                        ForEach(items.prefix(6)) { item in
                            VStack {
                                ProductCellUIView(image: item.image, name: item.name, additionalDescription: item.additionalDescription, price: item.price, minQuantity: item.minQuantity, minQuantityText: item.minQuantityText)
                                    .frame(height: UIScreen.main.bounds.height/3.5)
                            }
                            
                        }
                    }
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], spacing: 8) {
                        ForEach(items.prefix(6)) { item in
                            VStack {
                                ProductCellUIView(image: item.image, name: item.name, additionalDescription: item.additionalDescription, price: item.price, minQuantity: item.minQuantity, minQuantityText: item.minQuantityText)
                                    .frame(height: UIScreen.main.bounds.height/3.5)
                            }
                            
                        }
                    }
                    
                }
            }
            .padding(.horizontal,5)
            
        }
    }
}

#Preview {
    MainMenuUIView(items: [])
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct MainHeaderView: View {
    var body: some View {
        ZStack {
            Color.blue
            Text("Header")
                .foregroundColor(.white)
                .font(.title)
        }
    }
}
