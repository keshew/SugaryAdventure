import SwiftUI

struct Item {
    var image: String
    var name: String
}
struct FavoriteReceptModel {
    var arrayItem = [Item(image: ImageName.asia2.rawValue, name: "Lucky Red Bean Mooncake"),
                     Item(image: ImageName.america2.rawValue, name: "Red Velvet Patriot Cupcakes"),
                     Item(image: ImageName.asia1.rawValue, name: "Golden Wattle Delight"),
                     Item(image: ImageName.africa3.rawValue, name: "Savannah Sunrise Fruit Sala"),
                     Item(image: ImageName.asia3.rawValue, name: "Dragon's Breath Chocolate Lava Cake"),
                     Item(image: ImageName.america3.rawValue, name: "Chocolate Freedom Cupcakes"),
                     Item(image: ImageName.aussieDelight.rawValue, name: "Aussie Delight"),
                     Item(image: ImageName.tropicalCake.rawValue, name: "Tropical Sunrise Cake"),
                     Item(image: ImageName.africa1.rawValue, name: "African Sunset Fruit Tart"),
                     Item(image: ImageName.wattleDelight.rawValue, name: "Jade Dragon Fruit Cake"),
                     Item(image: ImageName.america1.rawValue, name: "Stars and Stripes Cupcakes"),
                     Item(image: ImageName.unionJake.rawValue, name: "Union Jack Cupcake"),
                     Item(image: ImageName.africa2.rawValue, name: "Safari Delight Mango Pudding"),
    ]
}


