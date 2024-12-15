//
//  MatBtiResultView.swift
//  UMai
//
//  Created by 전주환 on 12/14/24.
//

import SwiftUI

/// A view that displays the result of the user's MatBti personality type and its description.
struct MatBtiResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var userFoodType: String = ""
    @State private var showLoginScreen = false
    @State private var showSignupScreen = false
    
    // Dictionary for mapping food personality types to titles
    let foodTitles: [String: String] = [
        "FAHV": "The Spice Hunter \n매운 음식을 정복하는 맛 사냥꾼",
        "FAHP": "Fine Flavor Explorer \n프리미엄 자극의 모험가",
        "FASV": "Bouncy Bargain Seeker \n부드럽게 만나는 가성비 탐험가",
        "FASP": "Silk Road Pioneer 부드러운 \n맛의 럭셔리 여행자",
        "FTHV": "Crispy Value Guardian 바삭한 \n맛의 가성비 수호자",
        "FTHP": "Traditional Spice Artisan \n전통 있는 매운맛의 장인",
        "FTSV": "Soft Spice Economist \n부드러운 자극의 실속파",
        "FTSP": "Premium Comfort Master \n고급스러운 편안함의 달인",
        "CAHV": "Fresh Adventure Scout \n깔끔한 맛의 모험 스카우트",
        "CAHP": "Pure Luxury Wanderer \n깔끔한 맛의 고급 유랑가",
        "CASV": "Smooth Deal Hunter \n부드러운 가성비의 사냥꾼",
        "CASP": "Elegant Taste Curator \n우아한 맛의 큐레이터",
        "CTHV": "Classic Value Expert \n전통적 가치의 전문가",
        "CTHP": "Noble Taste Keeper \n고귀한 맛의 수호자",
        "CTSV": "Gentle Savings Guru \n부드러운 실속의 구루",
        "CTSP": "The Clean Aristocrat \n깔끔한 맛의 귀족"
    ]
    
    // Function to get the food personality title
    func getFoodTitle(for foodType: String) -> String {
        return foodTitles[foodType, default: "No food personality type selected."]
    }
    
    // Description for each food type
    var foodDescription: String {
        switch userFoodType {
        case "CTHV":
            return """
            CTHV는 깔끔한 맛을 선호하며, 전통적인 음식 선택을 추구하고, 바삭한 식감을 즐기면서도 가성비를 중시하는 성향을 가진 사람입니다.
                        
            특징:
            1. 전통적인 분위기의 한식당이나 합리적인 가격의 맛집을 선호합니다.
            
            2. 부담 없는 가격으로 깔끔하고 정갈한 음식을 즐기며, 과하지 않은 양을 선호합니다.
            
            3. 평범한 일상 속에서도 전통적인 음식의 가치를 느끼는 것을 중요시합니다.
            
            4. 가격 대비 품질과 전통성, 그리고 재료의 신선도를 중시합니다.
            """
        case "CASV":
            return """
            CASV는 깔끔한 맛을 선호하며, 새로운 음식을 시도하는 모험적인 태도를 가지고, 부드러운 식감을 좋아하면서도 가성비를 중시하는 성향을 가진 사람입니다.
            
            특징:
            1. 합리적인 가격으로 새로운 요리를 시도할 수 있는 카페나 레스토랑을 선호합니다.
            
            2. 가벼운 분위기에서 새로운 맛을 천천히 즐기며, 다양한 음식을 탐험합니다.
            
            3. 이국적인 음식이나 퓨전 요리를 가성비 좋게 경험하는 것을 좋아합니다.
            
            4. 깔끔한 맛과 부드러운 식감을 중심으로 가성비와 음식의 독창성을 평가합니다.
            """
        case "FTHV":
            return """
            FTHV는 자극적인 맛을 선호하며, 전통적인 음식에 안정감을 느끼고, 바삭한 식감을 좋아하면서도 가성비를 중요시하는 성향을 가진 사람입니다.
            
            특징:
            1. 대중적인 맛집, 프랜차이즈 레스토랑, 또는 가성비 좋은 한식 전문점을 선호합니다.
            
            2. 강렬한 풍미와 씹는 즐거움을 느끼며, 가성비 좋은 음식을 만족스럽게 즐깁니다.
            
            3. 특별한 날보다는 일상적인 상황에서도 가성비 좋은 음식을 찾아내는 데 관심이 많습니다.
            
            4. 풍미의 강렬함, 전통적인 요리 방식, 식감, 그리고 가성비를 종합적으로 고려합니다.
            """
        case "FASP":
            return """
            FASP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하고, 부드러운 식감을 좋아하며, 음식의 품질과 분위기를 중시하는 사람입니다.
            
            특징:
            1. 고급 레스토랑이나 특별한 분위기를 제공하는 이국적인 식당을 선호합니다.
            
            2. 강렬한 맛과 부드러운 식감의 조화를 느끼며, 여유로운 식사 시간을 중요하게 여깁니다.
            
            3. 미식 투어나 고급 테이스팅 코스를 통해 새로운 맛을 경험하고 싶어 합니다.
            
            4. 자극적인 맛, 부드러운 식감, 그리고 고품질 재료의 완벽한 조화를 중시합니다.
            """
        case "FTHP":
            return """
            FTHP는 자극적인 맛을 즐기고, 전통적인 음식에서 안정감을 느끼며, 바삭한 식감을 선호하고, 음식의 품질과 분위기를 중시하는 성향을 가진 사람입니다.
            
            특징:
            1. 대중적인 맛집, 프랜차이즈 레스토랑, 또는 가성비 좋은 한식 전문점을 선호합니다.
            
            2. 강렬한 풍미와 씹는 즐거움을 느끼며, 가성비 좋은 음식을 만족스럽게 즐깁니다.
            
            3. 특별한 날보다는 일상적인 상황에서도 가성비 좋은 음식을 찾아내는 데 관심이 많습니다.
            
            4. 풍미의 강렬함, 전통적인 요리 방식, 식감, 그리고 가성비를 종합적으로 고려합니다.
            """
        case "FASV":
            return """
            FASV는 자극적인 맛을 선호하며, 새로운 음식을 시도하고, 부드러운 식감을 좋아하면서도 가성비를 중시하는 성향을 가진 사람입니다.
            
            특징:
            1. 이국적인 음식을 합리적인 가격으로 즐길 수 있는 곳을 선호합니다.
            
            2. 자극적인 맛과 부드러운 식감의 조화를 느끼며, 간편하고 만족스러운 식사를 추구합니다.
            
            3. 퓨전 요리, 이국적인 간식 등 다양한 음식을 경험하고 싶어 합니다.
            
            4. 강렬한 풍미, 부드러운 식감, 그리고 합리적인 가격을 중요하게 생각합니다.
            """
        case "CASP":
            return"""
            CASP는 깔끔한 맛을 선호하며, 이국적이고 독특한 음식을 도전하고, 부드러운 식감을 좋아하며, 음식의 품질과 분위기를 중요하게 여기는 사람입니다.
            
            특징:
            1. 깔끔하고 독특한 요리를 제공하는 프리미엄 레스토랑을 주로 선택합니다.
            
            2. 새로운 음식을 천천히 음미하며, 식감과 풍미를 동시에 즐깁니다.
            
            3. 일상적인 식사보다는 특별한 경험을 제공하는 요리를 선호합니다.
            
            4. 깔끔한 맛, 새로운 경험, 부드러운 식감, 그리고 고급스러운 분위기를 종합적으로 고려합니다.
            """
        case "FAHV":
            return """
            FAHV는 자극적인 맛을 선호하며, 새로운 음식을 탐험하고, 바삭한 식감을 좋아하면서도 가성비를 중시하는 성향을 가진 사람입니다.
            
            특징:
            1. 합리적인 가격으로 독특하고 자극적인 음식을 제공하는 맛집을 선호합니다.
            
            2. 다양한 맛과 바삭한 식감을 느낄 수 있는 간편한 식사를 즐깁니다.
            
            3. 독특한 스낵류, 이국적인 길거리 음식 등을 탐험하며 가성비를 중요시합니다.
            
            4. 가격 대비 맛의 강렬함과 딱딱한 식감의 조화를 중요하게 생각합니다.
            """
        case "CTHP":
            return """
            CTHP는 깔끔한 맛을 선호하며, 전통적인 선택을 추구하고, 바삭한 식감을 즐기며, 음식의 품질과 분위기를 중시하는 성향을 가진 사람입니다.

            특징:
            1. 전통적인 한식을 고수하되, 미쉐린 레스토랑이나 고급 한정식을 선호합니다.
            
            2. 느긋하게 앉아 음식을 즐기는 것을 선호하며, 음식의 플레이팅과 분위기도 중요시합니다.
            
            3. 기념일이나 중요한 날에는 특별한 장소에서 품질 좋은 식사를 즐기는 것을 선호합니다.
            
            4. 음식이 단순히 맛있다/없다를 넘어, 재료의 신선도, 조리법의 전통성, 그리고 제공되는 환경을 종합적으로 평가합니다.
            """
        case "FAHP":
            return """
            FAHP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하는 모험적인 태도를 가지고, 딱딱한 식감을 좋아하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람입니다.

            특징:
            1. 자극적인 맛을 품격 있게 제공하는 고급 레스토랑을 선호합니다.
            
            2. 새로운 맛과 바삭한 식감의 고급 음식을 여유롭게 즐깁니다.
            
            3. 미슐랭 레스토랑이나 프리미엄 테이스팅 코스를 통해 독특한 음식을 경험하는 것을 좋아합니다.
            
            4. 자극적인 풍미, 바삭한 식감, 그리고 고급스러운 분위기와 품질을 중시합니다.
            """
        case "FTSP":
            return """
            FTSP는 자극적인 맛을 선호하며, 전통적인 음식을 좋아하고, 부드러운 식감을 선호하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람입니다.

            특징:
            1. 전통적인 요리를 고급스럽게 제공하는 레스토랑을 선호합니다.
            
            2. 부드러운 식감과 강렬한 맛을 품격 있는 환경에서 여유롭게 즐깁니다.
            
            3. 미식 투어나 고급 테이스팅 코스를 통해 새로운 맛을 경험하고 싶어 합니다.
            
            4. 자극적인 맛, 부드러운 식감, 그리고 고품질 재료의 완벽한 조화를 중시합니다.
            """
        case "FTSV":
            return """
            FTSV는 자극적인 맛을 선호하며, 전통적인 음식을 좋아하고, 부드러운 식감을 선호하면서도 가성비를 중시하는 성향을 가진 사람을 나타냅니다.

            특징:
            1. 전통적인 맛집이나 합리적인 가격의 한식당을 선호합니다.
            
            2. 부드러운 식감과 강렬한 맛을 즐기며, 부담 없는 식사를 선호합니다.
            
            3. 전통적인 음식을 합리적으로 경험하며 편안함을 느끼는 것을 좋아합니다.
            
            4. 강렬한 맛과 부드러운 식감, 그리고 가격 대비 만족도를 중요하게 생각합니다.
            """
        case "CAHV":
            return """
            CAHV는 깔끔한 맛을 선호하며, 새로운 음식을 탐험하는 모험적인 태도를 가지고, 딱딱한 식감을 좋아하면서도 가성비를 중시하는 성향을 가진 사람을 나타냅니다.

            특징
            1. 독특한 음식 메뉴가 있는 깔끔한 맛집을 선호하며, 가격 대비 효율적인 선택을 합니다.
            
            2. 깔끔하면서도 바삭한 음식을 부담 없이 즐기길 원합니다.
            
            3. 새로운 재료와 조리법이 있는 바삭한 메뉴를 시도하며 가성비를 중요하게 생각합니다.
            
            4. 음식이 깔끔한 맛과 딱딱한 식감을 제공하는 동시에 가격 면에서 만족스러워야 합니다.
            """
        case "CAHP":
            return """
            CAHP는 깔끔하고 신선한 맛을 선호하며, 새로운 맛을 경험하고자 하는 개방적인 태도를 가지고, 부드러운 식감을 좋아하면서도 질 좋은 재료를 중요하게 생각하는 성향을 가진 사람을 나타냅니다.

            특징:
            1.    깔끔한 맛과 신선한 재료를 중심으로 한 음식을 선호하며, 다양한 음식 경험을 통해 새로운 맛을 시도합니다.
            
            2.    부드러운 식감을 중요하게 생각하며, 식사가 편안하고 부담 없는 경험이 되기를 원합니다.
            
            3.    새로운 맛과 신선한 재료를 조화롭게 사용한 메뉴를 선호하며, 품질 높은 음식을 찾아 다니는 경향이 있습니다.
            
            4.    음식은 깔끔하고 신선한 맛을 제공하며, 질 좋은 재료가 포함되어 있어야 합니다.
            """
        case "CTSV":
            return """
            CTSV는 풍부한 맛을 선호하며, 다양한 재료와 조리법을 시도하는 것을 즐기고, 다양한 식감을 중시하며 식사의 질감을 다양하게 즐기는 성향을 가집니다.

            특징:
            1.    풍부하고 복합적인 맛의 음식을 선호하며, 다양한 재료와 조리법을 시도하는 것을 즐깁니다.
            
            2.    다양한 식감을 중요하게 생각하며, 식사는 질감이 풍부하고 다양한 요소가 결합된 경험이 되어야 한다고 느낍니다.
            
            3.    새로운 음식 경험을 좋아하며, 여러 가지 맛의 조화를 시도하려고 합니다.
            
            4.    음식은 풍부한 맛과 다양한 식감을 제공해야 하며, 여러 재료가 어우러지는 메뉴를 선호합니다.
            """
        case "CTSP":
            return """
            CTSP는 단순하고 클래식한 맛을 선호하며, 새로운 음식보다는 익숙한 맛을 좋아하는 경향을 보이고, 부드러운 식감을 선호하며 건강을 중요하게 여깁니다.

            특징:
            1. 단순하고 클래식한 맛의 음식을 선호하며, 변화보다는 안정적이고 익숙한 맛을 찾습니다.
            
            2. 부드러운 식감의 음식을 즐기며, 식사는 편안하고 부담 없는 경험이 되어야 한다고 생각합니다.
            
            3. 건강을 중요하게 생각하며, 식사에서의 영양과 균형을 고려하는 경향이 있습니다.
            
            4. 익숙한 맛이 제공되는 음식이지만, 건강과 균형이 잘 맞춰진 메뉴를 선호합니다.
            """
            
        default:
            return "No food personality type selected."
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // 배경 그라데이션
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("backgroundGray").opacity(0.8),
                        Color("backgroundGray").opacity(0.3)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // 장식용 동그라미들
                Circle()
                    .fill(Color("lightRed").opacity(0.1))
                    .frame(width: 200, height: 200)
                    .offset(x: -150, y: -300)
                
                Circle()
                    .fill(Color("lightRed").opacity(0.1))
                    .frame(width: 150, height: 150)
                    .offset(x: 170, y: 300)
                
                VStack(spacing: 0) {
                    // Header
                    VStack(spacing: 8) {
                        
                        Text("\(userFoodType) Food Personality")
                            .font(.custom("DMSerifDisplay-Regular", size: 31))
                            .foregroundColor(Color("lightRed"))
                            .shadow(color: Color("lightRed").opacity(0.3), radius: 2, x: 0, y: 2)
                        
                        Text(getFoodTitle(for: userFoodType))
                            .font(.custom("DMSerifDisplay-Regular", size: 20))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .shadow(color: Color("lightRed").opacity(0.3), radius: 2, x: 0, y: 2)
                        
                        // Food Description
                        Text(foodDescription)
                            .font(.custom("DMSerifDisplay-Regular", size: 14))
                            .foregroundColor(Color("lightRed"))
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .padding(.horizontal, 30)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                            )
                            .padding(.top, 20)
                            .padding(.horizontal, 30)
                    }
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.3))
                        
                        Text("To Learn More")
                            .font(.custom("DMSerifDisplay-Regular", size: 16))
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.3))
                    }
                    .padding(.bottom, 30)
                    
                    
                    Button {
                        showLoginScreen = true
                        
                        
                    } label: {
                        
                        Text("Login")
                            .font(.custom("DMSerifDisplay-Regular", size: 20))
                            .foregroundColor(Color("lightRed"))
                            .frame(maxWidth: 200)
                            .frame(height: 50)
                            .background(.white)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color("lightRed"), lineWidth: 1)
                            )
                            .padding(.bottom, 15)
                    }
                    
                    Button {
                        showSignupScreen = true
                        
                        
                    } label: {
                        
                        Text("Sign Up")
                            .font(.custom("DMSerifDisplay-Regular", size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: 200)
                            .frame(height: 50)
                            .background(Color("lightRed"))
                            .cornerRadius(25)
                            .padding(.bottom, 35)
                    }
                }
            }
            
            .fullScreenCover(isPresented: $showSignupScreen) {
                SignupView(matBTI: $userFoodType)
            }
            
            .fullScreenCover(isPresented: $showLoginScreen) {
                LoginView()
            }
        }

        .onAppear {
            if let storedFoodType = UserDefaults.standard.string(forKey: "userFoodType") {
                userFoodType = storedFoodType
            }
        }
    }
}

#Preview {
    MatBtiResultView()
}
