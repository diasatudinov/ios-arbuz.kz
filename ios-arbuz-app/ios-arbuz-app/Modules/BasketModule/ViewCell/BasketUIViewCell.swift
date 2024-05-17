//
//  BasketUIViewCell.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 17.05.2024.
//

import SwiftUI

struct BasketUIViewCell: View {
    @State var isFavorite: Bool = false
    @State var productCount = 1.0
    @State var kgPrice = 0.0
    let image: String = "item2"
    let name: String = "Филе индейки Arbuz Select 0,9 кг замороженное Select 0,9 кг замороженное"
    let additionalDescription: String = "dsadsadasd"
    let price: Int = 1000
    let minQuantity: Double = 1.0
    let minQuantityText: String = "шт"
    
    var body: some View {
        HStack(spacing: 5){
            ZStack {
                Color.clear
                Image(image)
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
                    Text(name)
                        .font(.system(size: 13))
                        .lineLimit(2)
                    Spacer()
                    Button{
                        
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(.gray.opacity(0.3))
                            .scaledToFit()
                            .frame(width: 12)
                    }
                }.padding(.top, 5)
                Text("\(price) ₸/\(minQuantityText)").font(.system(size: 13)).foregroundColor(.gray.opacity(0.6))
                Spacer()
                HStack {
                    HStack(spacing: 10) {
                        
                        Button{
                            if productCount > 0 {
                                productCount -= minQuantity
                                if minQuantityText == "кг" {
                                    kgPrice -= Double(price)
                                }
                            }
                        } label: {
                            if productCount == 1 {
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
                            
                            if minQuantityText == "кг"{
                                Text("\(productCount, specifier: "%.1f")").font(.system(size: 10)).foregroundColor(.black).bold()
                            } else {
                                Text("\(productCount, specifier: "%.0f")").font(.system(size: 10)).foregroundColor(.black).bold()
                            }
                            if minQuantityText == "кг"{
                                    Text("кг").font(.system(size: 10)).foregroundColor(.black).bold()
                            }
                        }
                        
                        Button{
                            productCount += minQuantity
                            if minQuantityText == "кг" {
                                kgPrice += Double(price)
                            }
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
                    if minQuantityText == "кг"{
                        Text("\(kgPrice, specifier: "%.0f") ₸").font(.system(size: 15)).foregroundColor(.black).bold()
                    } else {
                        Text("\(productCount*Double(price), specifier: "%.0f") ₸").font(.system(size: 15)).foregroundColor(.black).bold()
                    }
                    
                }
                
                
            }
            
            
            Spacer()
        }
        //                HStack(alignment: .top) {
        //                    Text(name)
        //                        .font(.system(size: 10))
        //                        .lineLimit(2)
        //                    Spacer()
        //                }.frame(width: UIScreen.main.bounds.width/3.2,height: 25)
        //
        //                HStack(spacing: 0) {
        //                    Text("\(price) ₸/\(minQuantityText)").font(.system(size: 10)).foregroundColor(.gray.opacity(0.6))
        //                    Circle().frame(width: 2, height: 2).padding(.horizontal,5).foregroundColor(.green)
        //                    if minQuantity  == 1 {
        //                        Text("\(minQuantity, specifier: "%.0f") \(minQuantityText)").font(.system(size: 10)).foregroundColor(.green)
        //                    } else {
        //                        Text("\(minQuantity, specifier: "%.1f") \(minQuantityText)").font(.system(size: 10)).foregroundColor(.green)
        //                    }
        //                    Spacer()
        //                }.padding(.bottom, 15).frame(width: UIScreen.main.bounds.width/3.2)
        //
        //                HStack{
        //                    if productCount == 0 {
        //                        Button{
        //                            productCount += minQuantity
        //                        } label: {
        //
        //                            HStack() {
        //                                Text("\(price) ₸").font(.system(size: 12)).foregroundColor(.black).bold()
        //                                Spacer()
        //                                Image(systemName: "plus").foregroundColor(.green).font(.system(size: 17))
        //
        //                            }
        //                            .padding(.horizontal, 10)
        //                            .padding(7)
        //
        //                        }
        //                    } else if productCount > 0 {
        //                        HStack {
        //                            Spacer()
        //                            Button{
        //                                productCount -= minQuantity
        //                            } label: {
        //
        //                                HStack(spacing: 10) {
        //                                    Image(systemName: "minus").foregroundColor(.white).font(.system(size: 17))
        //                                }
        //                                .padding(7)
        //
        //                            }
        //                            Spacer()
        //                            VStack {
        //
        //                                if minQuantity  == 1 {
        //                                    Text("\(productCount, specifier: "%.0f")").font(.system(size: 15)).foregroundColor(.white).bold()
        //                                } else {
        //                                    Text("\(productCount, specifier: "%.1f")").font(.system(size: 15)).foregroundColor(.white).bold()
        //                                }
        //
        //
        //                                if minQuantityText == "кг"{
        //                                    Text("кг").font(.system(size: 10)).foregroundColor(.white).bold()
        //                                }
        //                            }
        //                            Spacer()
        //                            Button{
        //                                productCount += minQuantity
        //                            } label: {
        //
        //                                HStack(spacing: 10) {
        //                                    Image(systemName: "plus").foregroundColor(.white).font(.system(size: 17))
        //                                }
        //                                .padding(7)
        //                            }
        //                            Spacer()
        //                        }
        //
        //                    }
        //                }.background(productCount == 0 ? Color.gray.opacity(0.2) : Color.green)
        //                    .frame(width: productCount == 0 ? UIScreen.main.bounds.width/3.2 : UIScreen.main.bounds.width/3.2)
        //                    .cornerRadius(40)
        
        
        // Spacer()
        
        
    }
}
