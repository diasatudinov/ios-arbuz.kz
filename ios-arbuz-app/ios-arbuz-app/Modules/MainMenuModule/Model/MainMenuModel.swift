//
//  MainMenuModel.swift
//  ios-arbuz-app
//
//  Created by Dias Atudinov on 14.05.2024.
//

import Foundation

class PositionData: Identifiable {
    let id = UUID().uuidString
    let items: [MenuItem]
    init(items: [MenuItem]) {
        self.items = items
    }
    
    static func getMockData() -> [MenuItem] {
        [
            MenuItem(image: "item1", name: "Абрикосы кг", description: "Абрикос Шалах любим во многих странах, ведь его можно добавлять в любые десерты, делать коктейли, соки, варить компоты, в нем содержится большое количество микроэлементов, именно поэтому это фрукт показан при авитаминозе и анемии.", additionalDescription: "-20%", country: "Узбекистан", storageConditions: "от +4° до +8°", price: 3550, minQuantity: 0.5, minQuantityText: "кг"),
            MenuItem(image: "item2", name: "Филе индейки Arbuz Select 0,9 кг замороженное", description: "Это наша грудка индейки шоковой заморозки. Натуральная грудка фермерской индейки, выращенной в экологически чистом районе Алматинской области.", additionalDescription: "", country: "Казахстан", storageConditions: "90 дней, -18°С", price: 5770, minQuantity: 1, minQuantityText: "шт"),
            MenuItem(image: "item3", name: "Самса Arbuz Select с рубленой говядиной 500 г", description: "Самса с рубленой говядиной - это вкусное сочетание нежного мяса и хрустящего теста, которое наверняка порадует ваши вкусовые рецепторы.", additionalDescription: "", country: "Казахстан", storageConditions: "90 дней, -18°С", price: 2590, minQuantity: 1, minQuantityText: "шт"),
            MenuItem(image: "item4", name: "Голубцы Arbuz Select с говядиной 500 г", description: "Голубцы с говядиной - это классическое блюдо, в основе которого лежат нежные и сочные капустные листья, начиненные ароматным фаршем из говядины, риса, лука и специй.", additionalDescription: "", country: "Казахстан", storageConditions: "90 дней, -18°С", price: 2690, minQuantity: 1, minQuantityText: "шт"),
            MenuItem(image: "item5", name: "Шоколад Milka с солёным крекером Tuc 87 г", description: "Примечание: Продукт имеет сертификацию Халяль \n\nМолочный шоколад Milka с добавлением целых плиток соленого крекера TUC придется по вкусу всем, кто любит сочетать контрастные вкусы. Нежный, тающий во рту шоколад Милка и хрустящая текстура соленого крекера.\n\nСостав: молочный шоколад (сахар, какао-масло, сухое обезжиренное молоко, какао тертое, сухая сыворотка, молочный жир, эмульгаторы (соевый лецитин, E 476), ароматизатор), 15% соленый крекер (пшеничная мука, пальмовое масло и пальмовый олеин, глюкозный сироп , экстракт ячменного солода, поваренная соль, пшеничный крахмал, разрыхлитель (бикарбонат натрия и аммоний E450i), сухое обезжиренное молоко, эмульгатор (соевый лецитин), сахар, ароматизаторы, порошковая мука (натриевое масло)). Без ГМО. Содержит пшеницу, молочные продукты, глютен, сульфиты, соевый лецитин, может содержать в незначительном количестве яйцепродукты и сою. Содержание какао продуктов в шоколадной массе - не менее 25%.", additionalDescription: "", country: "Украина", storageConditions: "", price: 620, minQuantity: 1, minQuantityText: "шт"),
            
            MenuItem(image: "item6", name: "Сыр Natura сливочный 45% 300 г", description: "Сливочный сыр Natura – это классический натуральный сыр со сливочным вкусом, произведенный по стандартам качества «Халяль». Сыр Natura не содержит консервантов и красителей.", additionalDescription: "", country: "Россия", storageConditions: "Дата изготовления и срoк годности указаны на упаковке, от 0°С до +6°С", price: 2095, minQuantity: 1, minQuantityText: "шт"),
            
            MenuItem(image: "item7", name: "Круассаны 7 Days мини с ванилью 200 г", description: "Примечание: Продукт имеет сертификацию халяль \n\nСостав: мука пшеничная, крем «ваниль» (сахар, гидрогенизированные растительные масла, вода, молоко сухое обезжиренное, сыворотка молочная сухая, спирт этиловый ректификованный, желток яичный сухой, эмульгатор ( полиглицерина и жирных кислот эфиры), стабилизатор (альгинат натрия) , ароматизатор идентичный натуральному - ванилин, консервант (сорбат калия)) , маргарин ( гидрогенизированные растительные масла, вода, соль, эмульгатор (моно- и диглицериды жирных кслот), регулятор кислотности (кислота лимонная), ароматизатор идентичный натуральному сливочный, консервант (сорбат калия)) , сахар, стабилизатор (моно- и диглицериды жирных кислот), дрожжи, вода, соль, ароматизатор идентичный натуральному - ванилин, консервант (пропионат кальция).", additionalDescription: "", country: "Россия", storageConditions: "", price: 945, minQuantity: 1, minQuantityText: "шт"),
            
            MenuItem(image: "item8", name: "Йогурт Epica натуральный с клубникой 4,8% 130 г", description: "Любимая классика — натуральный йогурт со сладкой клубникой! В составе помимо молока — сливки, благодаря которым йогурт отличается особенно нежной текстурой. Прекрасно подойдет в пару к оладушкам! Натуральные йогурты Epica — без консервантов и искусственных ароматизаторов. В составе только натуральное молоко и фрукты: поэтому йогурты не только вкусные, но и полезные. В каждой упаковке Epica в среднем 7,5г белка — около 10% суточной нормы!", additionalDescription: "", country: "Россия", storageConditions: "Дата изготовления и срoк годности указаны на упаковке, от +2°С до +6°", price: 420, minQuantity: 1, minQuantityText: "шт"),
            MenuItem(image: "item9", name: "Энергетический напиток Aibars 0,45 л, жестяная банка", description: "Энергетический напиток Aibars - это натуральное решение для поддержания активности и бодрости. Наш напиток разработан с использованием тщательно отобранных ингредиентов, включая натуральные адаптогены и витамины, чтобы предоставить вам долгосрочный прилив энергии, без резких скачков и падений. Без сомнения, Aibars - это идеальный выбор для тех, кто ищет здоровый способ поддержать высокий уровень активности и сосредоточенности. Попробуйте Aibars и ощутите разницу в вашей энергии и продуктивности. \n\nСостав: \nВода, сахар, лимонная кислота, таурин, регулятор кислотности(цитрат натрия);ароматизаторы, кофеин, экстракт гуараны, краситель, витамины, пантотеновая кислота.", additionalDescription: "", country: "Казахстан", storageConditions: "", price: 403, minQuantity: 1, minQuantityText: "шт"),
            MenuItem(image: "item10", name: "Йогурт Чудо Клубника земляника 2% 130 г", description: "Великолепное сочетание нежного густого йогурта с кусочками сочных ягод клубники земляники в новом удобном формате. Йогурт Чудо идеально подходит как для завтрака, так и для перекуса в течении дня", additionalDescription: "", country: "Россия", storageConditions: "", price: 380, minQuantity: 1, minQuantityText: "шт")
        
        ]
    }
}


class MenuItem: Identifiable, Equatable {
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        true
    }
    
    let id = UUID().uuidString
    let image: String
    let name: String
    let description: String
    let additionalDescription: String
    let country: String
    let storageConditions: String
    let price: Int
    let minQuantity: Double
    let minQuantityText: String
    var count: Double = 0.0
    var isFavorite: Bool = false
    
    init(image: String, name: String, description: String, additionalDescription: String, country: String, storageConditions: String, price: Int, minQuantity: Double, minQuantityText: String) {
        self.image = image
        self.name = name
        self.description = description
        self.additionalDescription = additionalDescription
        self.country = country
        self.storageConditions = storageConditions
        self.price = price
        self.minQuantity = minQuantity
        self.minQuantityText = minQuantityText

    }
}
