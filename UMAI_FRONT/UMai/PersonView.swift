//
//  PersonView.swift
//  UMai
//
//  Created by PeterPark on 11/27/24.
//

import SwiftUI

struct PersonView: View {
    @State private var showLoginView = false
    @State private var showSurveyView = false
    @StateObject private var userViewModel = UserViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundGray")
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 25) {
                        ProfileHeaderBlock(userViewModel: userViewModel)
                            .padding(.horizontal)
                        
                        // Action Buttons
                        VStack(spacing: 12) {
                            Button(action: {
                                // Edit Profile action
                            }) {
                                HStack {
                                    Text("Edit Profile")
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Image(systemName: "square.and.pencil")
                                }
                                .foregroundColor(Color("lightRed"))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(15)
                            }
                            
                            Button(action: {
                                showSurveyView = true
                                
                            }) {
                                HStack {
                                    Text("Logout")
                                        .fontWeight(.semibold)
                                    Spacer()
                                    Image(systemName: "arrow.right.circle")
                                }
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("lightRed"))
                                .cornerRadius(15)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    }
                    .padding(.top)
                }
            }
            .fullScreenCover(isPresented: $showSurveyView) {
                SurveyView()
            }
            .navigationBarHidden(true)
            .onAppear {
                if let token = UserDefaults.standard.string(forKey: "authToken") {
                    userViewModel.getUserInfo(token: token)
                }
            }
        }
    }
}

struct ProfileHeaderBlock: View {
    @State private var userFoodType: String = ""
    @State private var showingShareSheet = false
    @ObservedObject var userViewModel: UserViewModel // UserViewModel 전달
    
    var body: some View {
        VStack(spacing: 25) {
            // Profile Header
            HStack(alignment: .center) {
                // Profile Info
                VStack(alignment: .leading, spacing: 5) {
                    Text(userViewModel.userInfo["nickname"] as? String ?? "unknown")
                        .font(.custom("DMSerifDisplay-Regular", size: 28))
                        .foregroundColor(.black)
                    Text(getEnglishFoodTitle(for: userFoodType))
                        .font(.custom("DMSerifDisplay-Regular", size: 16))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Profile Image
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            .onAppear {
                if let storedFoodType = UserDefaults.standard.string(forKey: "userFoodType") {
                    userFoodType = storedFoodType
                }
            }
            
            // BTI Card
            BtiCardBlock(btiType: userViewModel.userInfo["btiType"] as? String ?? "Unknown",
                         description: userViewModel.userInfo["description"] as? String ?? "No description")
            
            // Share Button
            Button(action: {
                showingShareSheet = true
            }) {
                VStack(alignment: .center) {
                    Text("Share your MatBTI!")
                        .foregroundColor(Color("White"))
                        .font(.custom("DMSerifDisplay-Italic", size: 20))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                .frame(width: 200, alignment: .leading)
                .padding()
                .background(Color("lightRed"))
                .cornerRadius(12)
            }
            .padding(.horizontal, 8)
            
            // Additional Info
            HStack(spacing: 15) {
                InfoBox(title: "MBTI", value: userViewModel.userInfo["MBTI"] as? String ?? "Unknown")
                InfoBox(title: "즐겨찾기", value: userViewModel.userInfo["favor"] as? String ?? "Unknown")
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 25)
        }
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.05), radius: 15)
        .sheet(isPresented: $showingShareSheet) {
            ShareBTIView(
                btiType: userViewModel.userInfo["matBTI"] as? String ?? "Unknown",
                description: "깔끔한 맛의 귀족"
            )
        }
    }
}

struct BtiCardBlock: View {
    @State private var userFoodType: String = ""
    
    let btiType: String
    let description: String
    
    var body: some View {
        ZStack {
            // 배경 패턴
            GeometryReader { geometry in
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    
                    path.move(to: CGPoint(x: 0, y: height * 0.4))
                    path.addCurve(
                        to: CGPoint(x: width, y: height * 0.6),
                        control1: CGPoint(x: width * 0.4, y: height * 0.2),
                        control2: CGPoint(x: width * 0.6, y: height)
                    )
                    path.addLine(to: CGPoint(x: width, y: height))
                    path.addLine(to: CGPoint(x: 0, y: height))
                    path.closeSubpath()
                }
                .fill(LinearGradient(
                    colors: [Color("lightRed").opacity(0.3), Color("lightRed").opacity(0.1)],
                    startPoint: .top,
                    endPoint: .bottom
                ))
            }
            
            // 메인 콘텐츠
            VStack(spacing: 20) {
                Text("\(userFoodType)")
                    .font(.custom("DMSerifDisplay-Regular", size: 52))
                    .foregroundColor(Color("lightRed"))
                
                Text(getFoodTitle(for: userFoodType))
                    .font(.custom("DMSerifDisplay-Regular", size: 20))
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    TagView(text: "깔끔한")
                    TagView(text: "보수적")
                }
                HStack(spacing: 12) {
                    TagView(text: "말캉한 식감")
                    TagView(text: "품격 중시")
                }
            }
            .padding(.vertical, 40)
            .onAppear {
                if let storedFoodType = UserDefaults.standard.string(forKey: "userFoodType") {
                    userFoodType = storedFoodType
                }
            }
        }
        .frame(height: 300)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.horizontal, 25)
    }
}

struct TagView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color("lightRed"))
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Color("lightRed").opacity(0.1))
            )
    }
}

struct InfoBox: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

// BTI 타입과 설명
let tasteBTIClasses = [
    "FAHV": "매운 음식을 정복하는 맛 사냥꾼",
    "FAHP": "프리미엄 자극의 모험가",
    "FASV": "부드럽게 만나는 가성비 탐험가",
    "FASP": "부드러운 맛의 럭셔리 여행자",
    "FTHV": "바삭한 맛의 가성비 수호자",
    "FTHP": "전통 있는 매운맛의 장인",
    "FTSV": "부드러운 자극의 실속파",
    "FTSP": "고급스러운 편안함의 달인",
    "CAHV": "끔한 맛의 모험 스카우트",
    "CAHP": "깔끔한 맛의 고급 유랑가",
    "CASV": "부드러운 가성비의 사냥꾼",
    "CASP": "우아한 맛의 큐레이터",
    "CTHV": "전통적 가치의 전문가",
    "CTHP": "고귀한 맛의 수호자",
    "CTSV": "부드러운 실속의 구루",
    "CTSP": "깔끔한 맛의 귀족"
]

let englishBTIClass: [String: String] = [
    "FAHV": "The Spice Hunter",
    "FAHP": "Fine Flavor Explorer",
    "FASV": "Bouncy Bargain Seeker",
    "FASP": "Silk Road Pioneer 부드러운",
    "FTHV": "Crispy Value Guardian 바삭한",
    "FTHP": "Traditional Spice Artisan",
    "FTSV": "Soft Spice Economist",
    "FTSP": "Premium Comfort Master",
    "CAHV": "Fresh Adventure Scout",
    "CAHP": "Pure Luxury Wanderer",
    "CASV": "Smooth Deal Hunter",
    "CASP": "Elegant Taste Curator",
    "CTHV": "Classic Value Expert",
    "CTHP": "Noble Taste Keeper",
    "CTSV": "Gentle Savings Guru",
    "CTSP": "The Clean Aristocrat"
]



// Function to get the food personality title
func getFoodTitle(for foodType: String) -> String {
    return tasteBTIClasses[foodType, default: "No food personality type selected."]
}

func getEnglishFoodTitle(for foodType: String) -> String {
    return englishBTIClass[foodType, default: "No food personality type selected."]
}




#Preview {
    PersonView()
}
