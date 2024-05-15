//
//  ProductCellUIView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 15.05.2024.
//

import SwiftUI

struct ProductCellUIView: View {
    @State var isFavorite: Bool = false
    @State var productCount = 0
    let image: String
    let name: String
    let additionalDescription: String
    let price: Int
    let minQuantity: Double
    let minQuantityText: String
    var body: some View {
            VStack(alignment: .leading, spacing: 0){
                ZStack {
                    Color.clear
                    Image(image)
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
                    Text(name)
                        .font(.system(size: 10))
                        .lineLimit(2)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width/3.2,height: 25)
                
                HStack(spacing: 0) {
                    Text("\(price) ₸/\(minQuantityText)").font(.system(size: 10)).foregroundColor(.gray.opacity(0.6))
                    Circle().frame(width: 2, height: 2).padding(.horizontal,5).foregroundColor(.green)
                    if minQuantity  == 1 {
                        Text("\(minQuantity, specifier: "%.0f") \(minQuantityText)").font(.system(size: 10)).foregroundColor(.green)
                    } else {
                        Text("\(minQuantity, specifier: "%.2f") \(minQuantityText)").font(.system(size: 10)).foregroundColor(.green)
                    }
                    Spacer()
                }.padding(.bottom, 15).frame(width: UIScreen.main.bounds.width/3.2)
                
                HStack{
                    if productCount == 0 {
                        Button{
                            productCount += 1
                        } label: {
                            
                            HStack() {
                                Text("\(price) ₸").font(.system(size: 12)).foregroundColor(.black).bold()
                                Spacer()
                                Image(systemName: "plus").foregroundColor(.green).font(.system(size: 17))
                                
                            }
                            .padding(.horizontal, 10)
                            .padding(7)
                            
                        }
                    } else if productCount > 0 {
                        HStack {
                            Spacer()
                            Button{
                                productCount -= 1
                            } label: {
                                
                                HStack(spacing: 10) {
                                    Image(systemName: "minus").foregroundColor(.white).font(.system(size: 17))
                                }
                                .padding(7)
                                
                            }
                            Spacer()
                            VStack {
                                Text("\(productCount)").font(.system(size: 15)).foregroundColor(.white).bold()
                                if minQuantityText == "кг"{
                                    Text("кг").font(.system(size: 10)).foregroundColor(.white).bold()
                                }
                            }
                            Spacer()
                            Button{
                                productCount += 1
                            } label: {
                                
                                HStack(spacing: 10) {
                                    Image(systemName: "plus").foregroundColor(.white).font(.system(size: 17))
                                }
                                .padding(7)
                            }
                            Spacer()
                        }
                        
                    }
                }.background(productCount == 0 ? Color.gray.opacity(0.2) : Color.green)
                    .frame(width: productCount == 0 ? UIScreen.main.bounds.width/3.2 : UIScreen.main.bounds.width/3.2)
                    .cornerRadius(40)
                
                
                Spacer()
            }
        
    }
}

#Preview {
    ProductCellUIView(image: "", name: "", additionalDescription: "", price: 0, minQuantity: 1.0, minQuantityText: "")
}
