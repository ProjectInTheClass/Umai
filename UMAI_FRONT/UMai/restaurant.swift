//
//  restaurant.swift
//  UMai
//
//  Created by  전주환 on 12/10/24.
//

import Foundation

// Restaurant struct conforms to Decodable for data decoding
struct Restaurant: Identifiable, Decodable {
    var id: Int
    var name: String
    var location: String
    //var menu: [String]
    var foodImage: URL? // Optional, can be nil if no image URL is available
    var description: String
    var Taste: Int
    var price: Int
    var quantity: Int
    var accessibility: Int
    var emotion: Int


    // Define coding keys to match the JSON keys if they differ from the property names
    enum CodingKeys: String, CodingKey {
        case id = "restaurant_id" // If backend uses "_id" instead of "id"
        case name
        case location = "address"
        //case menu
        case Taste = "taste" // If the backend uses a lowercase key for Taste
        case price
        case quantity
        case accessibility
        case emotion = "ambiance"
        case description
        case foodImage = "food_image" // Assuming the backend uses "food_image" as the key
    }
}

// Example restaurant menu data
/*let exampleMenu1 = Restaurant(
    id: UUID().uuidString,
    name: "Sushi JO",
    location: "서울 성동구 용답19길 4-1",
    menu: ["연어덮밥"],
    Taste: 4,
    price: 3,
    quantity: 2,
    accessibility: 5,
    emotion: 4,
    description: "Mr. Takione, who has been running a cost-effective restaurant for Hanyang University students for 10 years, came to this ambitious new project after hearing about it through word of mouth. The steamed clams are a harmonious combination of clams, mussels, oysters, and other seafood, and the soup has a mild flavor.",
    foodImage: URL(string: "https://example.com/foodimage.jpg")
)

let exampleMenu2 = Restaurant(
    id: UUID().uuidString,
    name: "So Pheon",
    location: "사근동길45-17",
    menu: ["제육덮밥", "해장라면"],
    Taste: 5,
    price: 4,
    quantity: 3,
    accessibility: 3,
    emotion: 2,
    description: "제육덮밥은 한국에서 인기 있는 음식 중 하나로, 매콤한 고추장 양념에 돼지고기를 볶아 따뜻한 밥 위에 얹어 먹는 덮밥 요리입니다. ‘제육’은 돼지고기를 뜻하며, 고추장, 간장, 다진 마늘, 설탕, 참기름 등을 이용해 양념한 후, 양파, 대파, 당근 같은 야채와 함께 볶아 맛을 더합니다.",
    foodImage: URL(string: "https://example.com/foodimage2.jpg")
)*/

