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
    
    // Description for each food type
    var foodDescription: String {
        switch userFoodType {
        case "CTHV":
            return """
            CTHV는 깔끔한 맛을 선호하며, 전통적인 음식 선택을 추구하고, 바삭한 식감을 즐기면서도 가성비를 중시하는 성향을 가진 사람입니다.
                        
            특징:
            1. 전통적인 한식당이나 가성비 좋은 맛집을 선호
            2. 합리적인 가격으로 깔끔하고 정갈한 음식을 즐김
            3. 전통 음식의 가치를 중요시 함
            4. 가격 대비 품질, 전통성, 재료의 신선도 중시
            """
        case "CASV":
            return """
            CASV는 깔끔한 맛을 선호하며, 새로운 음식을 시도하는 모험적인 태도를 가지고, 부드러운 식감을 좋아하면서도 가성비를 중시하는 성향을 가진 사람입니다.
            
            특징:
            1. 새로운 요리를 합리적인 가격으로 시도
            2. 가벼운 분위기에서 다양한 음식을 천천히 탐험
            3. 이국적인 음식이나 퓨전 요리 선호
            4. 깔끔한 맛, 부드러운 식감, 음식의 독창성 평가
            """
        case "FTHV":
            return """
            FTHV는 자극적인 맛을 선호하며, 전통적인 음식에 안정감을 느끼고, 바삭한 식감을 좋아하면서도 가성비를 중요시하는 성향을 가진 사람입니다.
            
            특징:
            1. 전통 시장에서 가성비 좋은 간식 탐방하는 것을 즐김
            2. 강렬한 풍미와 바삭한 식감을 즐김
            3. 전통적인 조리법과 효율성 고려
            """
        case "FASP":
            return """
            FASP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하고, 부드러운 식감을 좋아하며, 음식의 품질과 분위기를 중시하는 사람입니다.
            
            특징:
            1. 고급 테이스팅 코스나 미식 투어
            2. 강렬한 맛과 부드러운 식감의 조화
            3. 프리미엄 디저트 카페 선호
            """
        case "FTHP":
            return """
            FTHP는 자극적인 맛을 즐기고, 전통적인 음식에서 안정감을 느끼며, 바삭한 식감을 선호하고, 음식의 품질과 분위기를 중시하는 성향을 가진 사람입니다.
            
            특징:
            1. 고급 전통 한식 코스 요리
            2. 미쉐린 레스토랑 탐방
            3. 강렬한 전통적 풍미를 고급스럽게 경험
            """
        case "FASV":
            return """
            FASV는 자극적인 맛을 선호하며, 새로운 음식을 시도하고, 부드러운 식감을 좋아하면서도 가성비를 중시하는 성향을 가진 사람입니다.
            
            특징:
            1. 이국적 스트리트 푸드 탐방
            2. 합리적인 세계 요리 뷔페
            3. 자극적이고 부드러운 디저트를 가성비 좋게 체험
            """
        case "CASP":
            return"""
            CASP는 깔끔한 맛을 선호하며, 이국적이고 독특한 음식을 도전하고, 부드러운 식감을 좋아하며, 음식의 품질과 분위기를 중요하게 여기는 사람입니다.
            
            특징:
            1. 파인다이닝 경험
            2. 세계 요리 체험
            3. 프리미엄 디저트 카페 투어
            """
        case "FAHV":
            return """
            FAHV는 자극적인 맛을 선호하며, 새로운 음식을 탐험하고, 바삭한 식감을 좋아하면서도 가성비를 중시하는 성향을 가진 사람입니다.
            
            특징:
            1. 이국적 맛집 탐방
            2. 길거리 음식의 강렬한 풍미 체험
            3. 가성비 높은 퓨전 요리 선호
            """
        case "CTHP":
            return """
            CTHP는 깔끔한 맛을 선호하며, 전통적인 선택을 추구하고, 바삭한 식감을 즐기며, 음식의 품질과 분위기를 중시하는 성향을 가진 사람입니다.

            특징
            1. 전통적인 한식을 고수하되, 미쉐린 레스토랑이나 고급 한정식을 선호함
            2. 느긋하게 앉아 음식을 즐기는 것을 선호하며, 음식의 플레이팅과 분위기도 중요함
            3. 기념일이나 중요한 날에는 특별한 장소에서 품질 좋은 식사를 즐기는 것을 선호함
            4. 음식이 단순히 맛있다/없다를 넘어, 재료의 신선도, 조리법의 전통성, 그리고 제공되는 환경을 종합적으로 평가함
            """
        case "FAHP":
            return """
            FAHP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하는 모험적인 태도를 가지고, 딱딱한 식감을 좋아하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람입니다.

            특징
            1. 자극적인 맛을 품격 있게 제공하는 고급 레스토랑을 선호함
            2. 새로운 맛과 바삭한 식감의 고급 음식을 여유롭게 즐김
            3. 미슐랭 레스토랑이나 프리미엄 테이스팅 코스를 통해 독특한 음식을 경험하는 것을 좋아함
            4. 자극적인 풍미, 바삭한 식감, 그리고 고급스러운 분위기와 품질을 중시함
            """
        case "FTSP":
            return """
            FTSP는 자극적인 맛을 선호하며, 전통적인 음식을 좋아하고, 부드러운 식감을 선호하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람입니다.

            특징
            1. 전통적인 요리를 고급스럽게 제공하는 레스토랑을 선호함
            2. 부드러운 식감과 강렬한 맛을 품격 있는 환경에서 여유롭게 즐김
            3. 미식 투어나 고급 테이스팅 코스를 통해 새로운 맛을 경험하고 싶어 합니다.
            4. 자극적인 맛, 부드러운 식감, 그리고 고품질 재료의 완벽한 조화를 중시합니다.
            """
        case "FTSV":
            return """
            FASP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하는 모험적인 태도를 가지고, 부드러운 식감을 좋아하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람을 나타냅니다.

            특징
            1. 고급 레스토랑이나 특별한 분위기를 제공하는 이국적인 식당을 선호합니다.
            2. 강렬한 맛과 부드러운 식감의 조화를 느끼며, 여유로운 식사 시간을 중요하게 여깁니다.
            3. 미식 투어나 고급 테이스팅 코스를 통해 새로운 맛을 경험하고 싶어 합니다.
            4. 자극적인 맛, 부드러운 식감, 그리고 고품질 재료의 완벽한 조화를 중시합니다.
            """
        case "CAHV":
            return """
            FASP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하는 모험적인 태도를 가지고, 부드러운 식감을 좋아하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람을 나타냅니다.

            특징
            1. 고급 레스토랑이나 특별한 분위기를 제공하는 이국적인 식당을 선호합니다.
            2. 강렬한 맛과 부드러운 식감의 조화를 느끼며, 여유로운 식사 시간을 중요하게 여깁니다.
            3. 미식 투어나 고급 테이스팅 코스를 통해 새로운 맛을 경험하고 싶어 합니다.
            4. 자극적인 맛, 부드러운 식감, 그리고 고품질 재료의 완벽한 조화를 중시합니다.
            """
        case "CAHP":
            return """
            FASP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하는 모험적인 태도를 가지고, 부드러운 식감을 좋아하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람을 나타냅니다.

            특징
            1. 고급 레스토랑이나 특별한 분위기를 제공하는 이국적인 식당을 선호합니다.
            2. 강렬한 맛과 부드러운 식감의 조화를 느끼며, 여유로운 식사 시간을 중요하게 여깁니다.
            3. 미식 투어나 고급 테이스팅 코스를 통해 새로운 맛을 경험하고 싶어 합니다.
            4. 자극적인 맛, 부드러운 식감, 그리고 고품질 재료의 완벽한 조화를 중시합니다.
            """
        case "CTSV":
            return """
            FASP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하는 모험적인 태도를 가지고, 부드러운 식감을 좋아하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람을 나타냅니다.

            특징
            1. 고급 레스토랑이나 특별한 분위기를 제공하는 이국적인 식당을 선호합니다.
            2. 강렬한 맛과 부드러운 식감의 조화를 느끼며, 여유로운 식사 시간을 중요하게 여깁니다.
            3. 미식 투어나 고급 테이스팅 코스를 통해 새로운 맛을 경험하고 싶어 합니다.
            4. 자극적인 맛, 부드러운 식감, 그리고 고품질 재료의 완벽한 조화를 중시합니다.
            """
        case "CTSP":
            return """
            FASP는 자극적인 맛을 선호하며, 새로운 음식을 탐험하는 모험적인 태도를 가지고, 부드러운 식감을 좋아하면서도 음식의 품질과 분위기를 중시하는 성향을 가진 사람을 나타냅니다.

            특징
            1. 고급 레스토랑이나 특별한 분위기를 제공하는 이국적인 식당을 선호합니다.
            2. 강렬한 맛과 부드러운 식감의 조화를 느끼며, 여유로운 식사 시간을 중요하게 여깁니다.
            3. 미식 투어나 고급 테이스팅 코스를 통해 새로운 맛을 경험하고 싶어 합니다.
            4. 자극적인 맛, 부드러운 식감, 그리고 고품질 재료의 완벽한 조화를 중시합니다.
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
                        Text("당신의 맛BTI는...")
                            .font(.custom("DMSerifDisplay-Regular", size: 38))
                            .foregroundColor(Color("lightRed"))
                            .shadow(color: Color("lightRed").opacity(0.3), radius: 2, x: 0, y: 2)
                        
                        Text(userFoodType)
                            .font(.custom("DMSerifDisplay-Regular", size: 16))
                            .foregroundColor(.gray)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                            )
                        
                        // Food Description
                        Text(foodDescription)
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                            )
                            .padding(.top, 20)
                    }
                    .padding(.top, 20)
                    
                    
                    Button {
                        showSignupScreen = true
                        
                        
                    } label: {
                        
                        Text("SignUP Now!")
                            .font(.custom("DMSerifDisplay-Regular", size: 23))
                            .foregroundColor(Color("White"))
                            .padding()
                            .background(Color("lightRed"))
                            .cornerRadius(12)
                            .padding(.top, 58)
                        
                    }
                }
            }
            
            .fullScreenCover(isPresented: $showSignupScreen) {
                SignupView(matBTI: $userFoodType)
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
