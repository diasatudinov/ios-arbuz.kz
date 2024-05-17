//
//  ProductCellUIView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 15.05.2024.
//

import SwiftUI

struct ProductCellUIView: View {
    @EnvironmentObject var basketManager: BasketManager
    @State var isFavorite: Bool = false
    @State var productCount = 0.0
    @State var item: MenuItem
    
    var body: some View {
            VStack(alignment: .leading, spacing: 0){
                ZStack {
                    Color.clear
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width/3.2)
                        .cornerRadius(15)
                        .overlay(
                            Button {
                                isFavorite.toggle()
                            } label: {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(isFavorite ? .red : .black)
                                    .frame(width: 18)
                            }.offset(x: 45, y: -45)
                            
                        )
                    
                }.padding(.bottom, 10)
                HStack(alignment: .top) {
                    Text(item.name)
                        .font(.system(size: 10))
                        .lineLimit(2)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width/3.2,height: 25)
                
                HStack(spacing: 0) {
                    Text("\(item.price) ₸/\(item.minQuantityText)").font(.system(size: 10)).foregroundColor(.gray.opacity(0.6))
                    Circle().frame(width: 2, height: 2).padding(.horizontal,5).foregroundColor(.green)
                    if item.minQuantity  == 1 {
                        Text("\(item.minQuantity, specifier: "%.0f") \(item.minQuantityText)").font(.system(size: 10)).foregroundColor(.green)
                    } else {
                        Text("\(item.minQuantity, specifier: "%.1f") \(item.minQuantityText)").font(.system(size: 10)).foregroundColor(.green)
                    }
                    Spacer()
                }.padding(.bottom, 15).frame(width: UIScreen.main.bounds.width/3.2)
                
                HStack{
                    if item.count == 0 {
                        Button{
                            productCount += item.minQuantity
                            basketManager.addItem(item)
                            print(item.count)
                        } label: {
                            
                            HStack() {
                                Text("\(item.price) ₸").font(.system(size: 12)).foregroundColor(.black).bold()
                                Spacer()
                                Image(systemName: "plus").foregroundColor(.green).font(.system(size: 17))
                                
                            }
                            .padding(.horizontal, 10)
                            .padding(7)
                            
                        }
                    } else if item.count > 0 {
                        HStack {
                            Spacer()
                            Button{
                                productCount -= item.minQuantity
                                basketManager.removeItem(item)
                                print(item.count)
                            } label: {
                                
                                HStack(spacing: 10) {
                                    Image(systemName: "minus").foregroundColor(.white).font(.system(size: 17))
                                }
                                .padding(7)
                                
                            }
                            Spacer()
                            VStack {
                                
                                if item.minQuantity  == 1 {
                                    Text("\(productCount, specifier: "%.0f")").font(.system(size: 15)).foregroundColor(.white).bold()
                                } else {
                                    Text("\(productCount, specifier: "%.1f")").font(.system(size: 15)).foregroundColor(.white).bold()
                                }
                                
                                
                                if item.minQuantityText == "кг"{
                                    Text("кг").font(.system(size: 10)).foregroundColor(.white).bold()
                                }
                            }
                            Spacer()
                            Button{
                                productCount += item.minQuantity
                                basketManager.addItem(item)
                                
                                print(item.count)
                            } label: {
                                
                                HStack(spacing: 10) {
                                    Image(systemName: "plus").foregroundColor(.white).font(.system(size: 17))
                                }
                                .padding(7)
                            }
                            Spacer()
                        }
                        
                    }
                }.background(item.count == 0 ? Color.gray.opacity(0.2) : Color.green)
                    .frame(width: item.count == 0 ? UIScreen.main.bounds.width/3.2 : UIScreen.main.bounds.width/3.2)
                    .cornerRadius(40)
                
                
                Spacer()
            }.onAppear {
                productCount = item.count
            }
            .onChange(of: item.count) { newValue in
                productCount = newValue
            }
        
    }
}

//#Preview {
//    ProductCellUIView(image: "", name: "", additionalDescription: "", price: 0, minQuantity: 1.0, minQuantityText: "")
//}
