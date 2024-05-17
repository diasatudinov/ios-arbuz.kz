//
//  BasketUIViewCell.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 17.05.2024.
//

import SwiftUI

struct BasketUIViewCell: View {
    @ObservedObject var basketManager: BasketManager
    
    init(item: MenuItem, basketManager: BasketManager) {
        self.item = item
        self.basketManager = basketManager
    }
    
    @State var isFavorite: Bool = false
    @State var productCount = 1.0
    @State var kgPrice = 0.0
    var item: MenuItem
    
    var body: some View {
        HStack(spacing: 5){
            ZStack {
                Color.clear
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.height/10, height: UIScreen.main.bounds.height/10)
                    .cornerRadius(15)
                    .overlay(
                        Button {
                            isFavorite.toggle()
                        } label: {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(isFavorite ? .red : .black)
                                .frame(width: 16)
                        }.offset(x: 25, y: -25)
                        
                    )
                
            }.frame(width: UIScreen.main.bounds.height/10, height: UIScreen.main.bounds.height/10)
            VStack(alignment: .leading, spacing: 1) {
                HStack{
                    Text(item.name)
                        .font(.system(size: 13))
                        .lineLimit(2)
                    Spacer()
                    Button{
                        basketManager.removeFullItem(item)
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(.gray.opacity(0.3))
                            .scaledToFit()
                            .frame(width: 12)
                    }
                }.padding(.top, 5)
                Text("\(item.price) ₸/\(item.minQuantityText)").font(.system(size: 13)).foregroundColor(.gray.opacity(0.6))
                Spacer()
                HStack {
                    HStack(spacing: 10) {
                        
                        Button{
                            if productCount > 0 {
                                basketManager.removeItem(item)
                                productCount -= item.minQuantity
                                if item.minQuantityText == "кг" {
                                    kgPrice -= Double(item.price)
                                }
                                
                                basketManager.subFromSumma(summa: Double(item.price))
                                
                                print(basketManager.summa)
                                
                            }
                        } label: {
                            if productCount == item.minQuantity {
                                HStack(spacing: 10) {
                                    Image(systemName: "trash").foregroundColor(.black).font(.system(size: 10))
                                }
                                .padding(7)
                            } else {
                                HStack(spacing: 10) {
                                    Image(systemName: "minus").foregroundColor(.black).font(.system(size: 10))
                                }
                                .padding(5)
                            }
                            
                        }
                        
                        VStack {
                            
                            if item.minQuantityText == "кг"{
                                Text("\(productCount, specifier: "%.1f")").font(.system(size: 10)).foregroundColor(.black).bold()
                            } else {
                                Text("\(productCount, specifier: "%.0f")").font(.system(size: 10)).foregroundColor(.black).bold()
                            }
                            if item.minQuantityText == "кг"{
                                    Text("кг").font(.system(size: 10)).foregroundColor(.black).bold()
                            }
                        }
                        
                        Button{
                            basketManager.addItem(item)
                            productCount += item.minQuantity
                            if item.minQuantityText == "кг" {
                                kgPrice += Double(item.price)
                            }
                            
                            
                            basketManager.addToSumma(summa: Double(item.price))
                            
                            print(basketManager.summa)
                        } label: {
                            
                            HStack(spacing: 10) {
                                Image(systemName: "plus").foregroundColor(.black).font(.system(size: 10))
                            }
                            .padding(5)
                        }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width/4.5 ,height: UIScreen.main.bounds.height/50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                    Spacer()
                    if item.minQuantityText == "кг"{
                        Text("\(kgPrice, specifier: "%.0f") ₸").font(.system(size: 15)).foregroundColor(.black).bold()
                    } else {
                        Text("\(productCount*Double(item.price), specifier: "%.0f") ₸").font(.system(size: 15)).foregroundColor(.black).bold()
                    }
                    
                }
                
                
            }
            
            
            Spacer()
        }.onAppear {
            productCount = item.count
            if item.minQuantityText == "кг" {
                
                kgPrice = Double(item.price) * item.count/item.minQuantity
            }
        }
        
        
    }
}
