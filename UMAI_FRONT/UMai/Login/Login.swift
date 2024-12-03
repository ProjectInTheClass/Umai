//
//  Login.swift
//  UMai
//
//  Created by PeterPark on 12/3/24.
//

import SwiftUI

struct SurveyQuestion: Identifiable {
    let id = UUID()
    let question: String
    var answer: String = ""
}

// 사용자 데이터 모델
struct UserData: Codable {
    var email: String
    var password: String
}

// 메인 뷰 모델
class SurveyLoginViewModel: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var questions: [SurveyQuestion] = [
        SurveyQuestion(question: "당신의 연령대는 어떻게 되시나요?"),
        SurveyQuestion(question: "이 앱을 어떻게 알게 되셨나요?"),
        SurveyQuestion(question: "주로 어떤 기능을 사용하실 것 같으신가요?"),
        SurveyQuestion(question: "평소 비슷한 서비스를 얼마나 자주 사용하시나요?"),
        SurveyQuestion(question: "앱에서 가장 중요하게 생각하는 요소는 무엇인가요?"),
        SurveyQuestion(question: "선호하는 알림 수신 방식은 무엇인가요?"),
        SurveyQuestion(question: "주로 어느 시간대에 앱을 사용하실 것 같으신가요?"),
        SurveyQuestion(question: "앱 사용 목적이 무엇인가요?"),
        SurveyQuestion(question: "원하는 새로운 기능이 있다면 무엇인가요?"),
        SurveyQuestion(question: "개인정보 보호에 대해 얼마나 중요하게 생각하시나요?"),
        SurveyQuestion(question: "앱의 디자인 스타일 선호도는 어떻게 되시나요?"),
        SurveyQuestion(question: "베타 테스터 참여 의향이 있으신가요?"),
        SurveyQuestion(question: "앱 추천 의향이 있으신가요?"),
        SurveyQuestion(question: "피드백을 제공할 의향이 있으신가요?"),
        SurveyQuestion(question: "어떤 운영체제를 사용하시나요?"),
        SurveyQuestion(question: "앱 사용 경험 수준은 어떻게 되시나요?"),
        SurveyQuestion(question: "선호하는 지원 방식은 무엇인가요?"),
        SurveyQuestion(question: "앱 업데이트 주기 선호도는 어떻게 되시나요?"),
        SurveyQuestion(question: "데이터 백업 방식 선호도는 어떻게 되시나요?"),
        SurveyQuestion(question: "추가로 제안하고 싶은 의견이 있으신가요?")
    ]
    
    @Published var showLoginScreen = false
    @Published var email = ""
    @Published var password = ""
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showLoginScreen = true
        }
    }
    
    func handleLogin() {
        // 로그인 로직 구현
        print("Login attempted with email: \(email)")
    }
}
struct Login: View {
    @StateObject private var viewModel = SurveyLoginViewModel()
        
        var body: some View {
            if viewModel.showLoginScreen {
                LoginView(viewModel: viewModel)
            } else {
                SurveyView(viewModel: viewModel)
            }
        }
}

#Preview {
    Login()
}
