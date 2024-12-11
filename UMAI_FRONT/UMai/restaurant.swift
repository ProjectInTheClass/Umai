//
//  restaurant.swift
//  UMai
//
//  Created by  전주환 on 12/10/24.
//

import Foundation

// Restaurant struct conforms to Decodable for data decoding
struct Restaurant: Identifiable, Decodable, Hashable {
    var id: Int
    var name: String
    var location: String
    var menu: String
    var imageName: URL? // Optional, can be nil if no image URL is available
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
        case menu
        case Taste = "taste" // If the backend uses a lowercase key for Taste
        case price
        case quantity
        case accessibility
        case emotion = "ambiance"
        case description
        case imageName = "foodImage"
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

//let MSFPMenu1 = Restarurant(
//    name: "HotPot Palace",
//    location: "서울 성동구 왕십리로 222",
//    menu: ["마라탕", "마라샹궈"],
//    Taste: 5,
//    price: 4,
//    quantity: 4,
//    accessibility: 3,
//    emotion: 5,
//    description: "마라탕은 중국 사천 지방의 전통적인 음식으로, 특유의 마비와 얼얼한 맛이 특징입니다. 신선한 재료와 비법 양념을 사용하여 깊은 맛을 내고 있으며, 손님이 직접 재료를 선택할 수 있습니다.", imageName: "HotPot"
//)
//
//let MSFPMenu2 = Restarurant(
//    name: "Ramen King",
//    location: "서울 용산구 이태원로 123",
//    menu: ["돈코츠라멘", "차슈라멘"],
//    Taste: 4,
//    price: 3,
//    quantity: 5,
//    accessibility: 4,
//    emotion: 4,
//    description: "일본 전통 방식으로 만든 돈코츠 라멘을 제공합니다. 돼지뼈를 12시간 이상 끓여 만든 진한 국물과 쫄깃한 면발이 특징이며, 특제 차슈는 부드럽고 감칠맛이 뛰어납니다.", imageName: "ramen"
//)
//
//let MSFPMenu3 = Restarurant(
//    name: "Deopbap House",
//    location: "서울 마포구 와우산로 123",
//    menu: ["연어덮밥", "참치덮밥"],
//    Taste: 5,
//    price: 3,
//    quantity: 4,
//    accessibility: 5,
//    emotion: 3,
//    description: "신선한 해산물을 사용하여 만드는 프리미엄 덮밥 전문점입니다. 매일 아침 노량진 수산시장에서 직접 공수한 연어와 참치로 요리하며, 특제 간장 소스가 일품입니다.", imageName: "deopbap"
//)
//
//// Local 메뉴
//let localMenu1 = Restarurant(
//    name: "Omurice Factory",
//    location: "서울 종로구 대학로 123",
//    menu: ["오므라이스", "카레라이스"],
//    Taste: 4,
//    price: 2,
//    quantity: 5,
//    accessibility: 5,
//    emotion: 4,
//    description: "부드러운 달걀로 감싼 특제 볶음밥이 특징인 오므라이스 전문점입니다. 20년 경력의 셰프가 만드는 특제 데미글라스 소스와 함께 즐기는 오므라이스는 남녀노소 모두에게 사랑받고 있습니다.", imageName: "Omurice"
//)
//
//let localMenu2 = Restarurant(
//    name: "Rice Cake Heaven",
//    location: "서울 강남구 강남대로 123",
//    menu: ["즉석떡볶이", "치즈떡볶이"],
//    Taste: 5,
//    price: 2,
//    quantity: 5,
//    accessibility: 4,
//    emotion: 5,
//    description: "3대째 내려오는 비법 레시피로 만드는 즉석 떡볶이 전문점입니다. 매콤달콤한 특제 소스와 쫄깃한 떡, 다양한 토핑으로 취향에 맞게 즐길 수 있습니다.", imageName: "rice cake"
//)
//
//let localMenu3 = Restarurant(
//    name: "Sashimi World",
//    location: "서울 서초구 서초대로 123",
//    menu: ["모듬사시미", "연어사시미"],
//    Taste: 5,
//    price: 5,
//    quantity: 3,
//    accessibility: 3,
//    emotion: 5,
//    description: "최고급 활어만을 사용하는 사시미 전문점입니다. 매일 아침 공수되는 신선한 해산물로 만드는 사시미는 깊은 맛과 신선함을 자랑합니다.", imageName: "Sashimi"
//)
//
//// Popular 메뉴
//let popularMenu1 = Restarurant(
//    name: "Yakisoba Street",
//    location: "서울 중구 명동길 123",
//    menu: ["야키소바", "야키우동"],
//    Taste: 4,
//    price: 3,
//    quantity: 4,
//    accessibility: 5,
//    emotion: 3,
//    description: "일본 현지의 맛을 그대로 재현한 야키소바 전문점입니다. 매일 아침 반죽부터 시작하는 수제 면과 특제 소스의 조화가 일품입니다.", imageName: "Yakisoba"
//)
//
//let popularMenu2 = Restarurant(
//    name: "Yukhoe Master",
//    location: "서울 송파구 올림픽로 123",
//    menu: ["육회", "육사시미"],
//    Taste: 5,
//    price: 5,
//    quantity: 3,
//    accessibility: 3,
//    emotion: 5,
//    description: "최상급 한우만을 사용하는 육회 전문점입니다. 신선한 재료와 위생적인 조리 과정으로 안전하고 맛있는 육회를 제공합니다.", imageName: "Yukhoe"
//)
//
//let popularMenu3 = Restarurant(
//    name: "Sushi JO",
//    location: "서울 성동구 용답19길 4-1",
//    menu: ["연어덮밥"],
//    Taste: 4,
//    price: 3,
//    quantity: 2,
//    accessibility: 5,
//    emotion: 4,
//    description: "Mr. Takione, who has been running a cost-effective restaurant for Hanyang University students for 10 years, came to this ambitious new project after hearing about it through word of mouth. The steamed clams are a harmonious combination of clams, mussels, oysters, and other seafood, and the soup has a mild flavor.", imageName: "Sushi"
//)
//
//// 모든 메뉴를 카테고리별로 정리
//let MSFPMenus = [MSFPMenu1, MSFPMenu2, MSFPMenu3]
//let localMenus = [localMenu1, localMenu2, localMenu3]
//let popularMenus = [popularMenu1, popularMenu2, popularMenu3]
//let allMenu =  localMenus + popularMenus

