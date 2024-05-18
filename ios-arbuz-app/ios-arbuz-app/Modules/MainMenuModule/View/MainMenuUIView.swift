//
//  MainMenuUIView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 15.05.2024.
//

import SwiftUI
import UIKit


struct MainMenuUIView: View {
    
    
    @EnvironmentObject var basketManager: BasketManager
    @State var items: [MenuItem]
    @State private var headerOffset: CGFloat = 0
    @State private var isHeaderHidden = false
    
       
    
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false){
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: OffsetKey.self, value: geometry.frame(in: .global).minY)
                        .onPreferenceChange(OffsetKey.self) { value in
                            withAnimation {
                                headerOffset = value
                                isHeaderHidden = value < UIScreen.main.bounds.height / 19
                                // Скрыть хэдер, если скролл больше -50
                            }
                        }
                }
                .frame(height: 0)
                
                VStack(alignment: .leading) {
                    if !isHeaderHidden {
                        Button {
                            TheAppRouter.shared.move(to: .address, type: .present(animated: true))
                            
                        } label: {
                            HeaderUIView()
                                .frame(height: 50)
                                .offset(y: headerOffset < 0 ? headerOffset : 0)
                                .animation(.easeInOut)
                        }
                    }
                    Text("Новинки для Вас")
                        .font(.title3).bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(items.reversed().prefix(6)) { item in
                                ProductCellUIView(item: item)
                                    .frame(height: UIScreen.main.bounds.height/3.5)
                                    .onTapGesture {
                                        print(item.name)
                                        print(basketManager.items)
                                        print(basketManager.items.first?.count)
                                        TheAppRouter.shared.move(
                                            to: .productDetails(item: item, basketManager: basketManager),
                                            type: .present(animated: true)
                                        )
                                    }
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    Text("для Friends")
                        .font(.title3).bold()
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], spacing: 8) {
                        ForEach(items.prefix(6)) { item in
                            VStack {
                                ProductCellUIView(item: item)
                                    .onTapGesture {
                                        print(item.name)
                                        TheAppRouter.shared.move(
                                            to: .productDetails(item: item, basketManager: basketManager),
                                            type: .present(animated: true)
                                        )
                                    }
                            }
                            
                        }
                    }
                    
                    
                }
            }
            .padding(.horizontal,5)
            
        }
    }
}

//#Preview {
//    MainMenuUIView(items: [])
//}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
