//
//  ProductDetailsUIView.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 16.05.2024.
//

import SwiftUI

struct ProductDetailsUIView: View {
    @State var isFavorite: Bool = false
    @State var productCount = 0.0
    @State var kgPrice = 0.0
    let image: String
    let name: String
    let description: String
    let additionalDescription: String
    let country: String
    let storageConditions: String
    let price: Int
    let minQuantity: Double
    let minQuantityText: String
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Button {
                    TheAppRouter.shared.backFromSheet()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 18)
                        .padding()
                }
                
                Spacer()
                Button {
                    isFavorite.toggle()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(isFavorite ? .red : .black)
                        .frame(width: 22)
                        .padding()
                }
            }
            
            ScrollView {
                VStack {
                    ZStack {
                        Color.clear
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width)
                            .cornerRadius(15)
                        
                    }.padding(.bottom, 10)
                    
                    Text(name)
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(.horizontal, 5)
                        .padding(.bottom, 5)
                    
                    Text("\(price) ₸/\(minQuantityText)")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray.opacity(0.7))
                        .frame(width: UIScreen.main.bounds.width)
                        .padding(.bottom, 5)
                    HStack {
                        Text("Описание")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.horizontal, 10)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                    Text(description)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 10)
                    
                    Divider().padding(10)
                    if storageConditions != "" {
                        DisclosureGroup {
                            HStack {
                                Text(storageConditions)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray.opacity(0.8))
                                    .padding(.horizontal, 10)
                                Spacer()
                            }
                        } label: {
                            Text("Условия хранения")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)
                        }
                        Divider().padding(10)
                    }
                    if country != "" {
                        DisclosureGroup {
                            HStack {
                                Text(country)
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray.opacity(0.8))
                                    .padding(.horizontal, 10)
                                Spacer()
                            }
                        } label: {
                            Text("Страна")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)
                        }.padding(.bottom, 10)
                    }
                    
                }
                
            }
            
            
            ZStack{
                Color.green.ignoresSafeArea()
                HStack{
                    if productCount == 0 {
                        Button{
                            
                            productCount += minQuantity
                            if minQuantityText == "кг" {
                                kgPrice += Double(price)
                            }
                        } label: {
                            
                            HStack(spacing: 7) {
                                VStack{
                                    Text("\(price) ₸").font(.system(size: 18)).foregroundColor(.white).bold()
                                    
                                    if minQuantityText == "кг"{
                                        if minQuantity  == 1 {
                                            Text("за \(minQuantity, specifier: "%.0f") кг").font(.system(size: 15)).foregroundColor(.white).bold()
                                        } else {
                                            Text("за \(minQuantity, specifier: "%.1f") кг").font(.system(size: 15)).foregroundColor(.white).bold()
                                        }
                                    } else {
                                        Text("за шт").font(.system(size: 10)).foregroundColor(.white).bold()
                                        
                                    }
                                }
                                Image(systemName: "plus").foregroundColor(.white).font(.system(size: 25))
                                
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 10)
                            
                        }
                    } else if productCount > 0 {
                        HStack {
                            
                            Button{
                                if productCount > 0 {
                                    productCount -= minQuantity
                                    if minQuantityText == "кг" {
                                        kgPrice -= Double(price)
                                    }
                                }
                                
                            } label: {
                                
                                HStack(spacing: 10) {
                                    Image(systemName: "minus").foregroundColor(.white).font(.system(size: 25))
                                }
                                
                            }
                            Spacer()
                            VStack {
                                if minQuantityText == "кг"{
                                    Text("\(kgPrice, specifier: "%.0f") ₸").font(.system(size: 25)).foregroundColor(.white).bold()
                                } else {
                                    Text("\(productCount*Double(price), specifier: "%.0f") ₸").font(.system(size: 25)).foregroundColor(.white).bold()
                                }
                                if minQuantityText == "кг"{
                                    if minQuantity  == 1 {
                                        Text("за \(productCount, specifier: "%.0f") кг").font(.system(size: 15)).foregroundColor(.white).bold()
                                    } else {
                                        Text("за \(productCount, specifier: "%.1f") кг").font(.system(size: 15)).foregroundColor(.white).bold()
                                    }
                                } else {
                                    Text("\(productCount, specifier: "%.0f") шт").font(.system(size: 10)).foregroundColor(.white).bold()
                                    
                                }
                                
                                
//                                if minQuantity  == 1 {
//                                    
//                                } else {
//                                    Text("\(productCount*Double(price), specifier: "%.1f")").font(.system(size: 25)).foregroundColor(.white).bold()
//                                }
//                                
//                                
//                                if minQuantityText == "кг"{
//                                    Text("кг").font(.system(size: 10)).foregroundColor(.white).bold()
//                                }
                            }
                            Spacer()
                            Button{
                                productCount += minQuantity
                                if minQuantityText == "кг" {
                                    kgPrice += Double(price)
                                }
                            } label: {
                                
                                HStack(spacing: 10) {
                                    Image(systemName: "plus").foregroundColor(.white).font(.system(size: 25))
                                }
                                
                            }
                            
                        }.padding(.horizontal, 20)
                        
                    }
                }
            }.frame(height: UIScreen.main.bounds.height/14)
        }
//            VStack(alignment: .leading, spacing: 0){
//                ZStack {
//                    Color.clear
//                    Image(image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: UIScreen.main.bounds.width/3.2)
//                        .cornerRadius(15)
//                        .overlay(
//                            Button {
//                                isFavorite.toggle()
//                            } label: {
//                                Image(systemName: isFavorite ? "heart.fill" : "heart")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .foregroundColor(isFavorite ? .red : .black)
//                                    .frame(width: 18)
//                            }.offset(x: 45, y: -45)
//                            
//                        )
//                    
//                }.padding(.bottom, 10)
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
//                
//                
//                Spacer()
//            }
        
    }
}

#Preview {
    ProductDetailsUIView(image: "item1", name: "Абрикосы кг", description: "Абрикос Шалах любим во многих странах, ведь его можно добавлять в любые десерты, делать коктейли, соки, варить компоты, в нем содержится большое количество микроэлементов, именно поэтому это фрукт показан при авитаминозе и анемии.", additionalDescription: "-20%", country: "Узбекистан", storageConditions: "от +4° до +8°", price: 3550, minQuantity: 0.5, minQuantityText: "кг")
}
