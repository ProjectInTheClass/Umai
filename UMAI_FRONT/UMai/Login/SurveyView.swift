//
//  SurveyView.swift
//  UMai
//
//  Created by PeterPark on 12/3/24.
//

import SwiftUI

struct SurveyView: View {
    @State private var currentPage = 0
    @State private var scores = [
        "F": 0, "C": 0,
        "A": 0, "T": 0,
        "H": 0, "S": 0,
        "V": 0, "P": 0
    ]
    @State private var showLoginScreen = false
    @State private var progress: CGFloat = 0.2
    
    let questions = [
        SurveySection(title: "맛의 취향", questions: [
            SurveyQuestion(text: "매운 음식을 보면 꼭 한번 도전해보고 싶어요!", positiveType: "F", negativeType: "C", subtitle: "당신의 맵찔이 지수는?")
        ]),
        SurveySection(title: "도전 정신", questions: [
            SurveyQuestion(text: "새로운 메뉴가 있다면 꼭 먹어보고 싶어요!", positiveType: "A", negativeType: "T", subtitle: "호기심 가득한 미식가?")
        ]),
        SurveySection(title: "식감 선호도", questions: [
            SurveyQuestion(text: "바삭바삭한 간식이 제일 좋아요!", positiveType: "H", negativeType: "S", subtitle: "바삭 vs 말랑")
        ]),
        SurveySection(title: "가치 기준", questions: [
            SurveyQuestion(text: "양이 많고 가성비 좋은 음식이 최고예요!", positiveType: "V", negativeType: "P", subtitle: "실속파 vs 분위기파")
        ]),
        SurveySection(title: "마지막 질문", questions: [
            SurveyQuestion(text: "특별한 날엔 분위기 좋은 레스토랑에서 먹고 싶어요!", positiveType: "P", negativeType: "V", subtitle: "당신의 선택은?")
        ])
    ]
    
    var body: some View {
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
                // Progress Bar
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white)
                            .frame(height: 12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("lightRed"))
                            .frame(width: geometry.size.width * progress, height: 12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("lightRed").opacity(0.5), lineWidth: 1)
                            )
                    }
                }
                .frame(height: 12)
                .padding(.horizontal, 30)
                .padding(.top, 60)
                
                // Header
                VStack(spacing: 8) {
                    Text("맛BTI 테스트")
                        .font(.custom("DMSerifDisplay-Regular", size: 38))
                        .foregroundColor(Color("lightRed"))
                        .shadow(color: Color("lightRed").opacity(0.3), radius: 2, x: 0, y: 2)
                    
                    Text("나의 음식 취향을 알아보아요!")
                        .font(.custom("DMSerifDisplay-Regular", size: 16))
                        .foregroundColor(.gray)
                    
                    Text("\(currentPage + 1)/5")
                        .font(.custom("DMSerifDisplay-Regular", size: 20))
                        .foregroundColor(Color("lightRed"))
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .background(
                            Capsule()
                                .fill(Color.white)
                                .shadow(color: Color.gray.opacity(0.2), radius: 3, x: 0, y: 2)
                        )
                }
                .padding(.top, 20)
                
                if currentPage < questions.count {
                    // Question Card
                    VStack(spacing: 25) {
                        VStack(spacing: 12) {
                            Text(questions[currentPage].questions[0].subtitle)
                                .font(.custom("DMSerifDisplay-Regular", size: 18))
                                .foregroundColor(Color("lightRed"))
                            
                            Text(questions[currentPage].questions[0].text)
                                .font(.custom("DMSerifDisplay-Regular", size: 22))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .foregroundColor(.black.opacity(0.8))
                        }
                        
                        // Answer Buttons
                        VStack(spacing: 15) {
                            CuteAnswerButton(text: "네 맞아요!", isPositive: true) {
                                updateScore(for: questions[currentPage].questions[0], isPositive: true)
                                nextQuestion()
                            }
                            
                            CuteAnswerButton(text: "아니에요!", isPositive: false) {
                                updateScore(for: questions[currentPage].questions[0], isPositive: false)
                                nextQuestion()
                            }
                        }
                        .padding(.top, 20)
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .shadow(color: Color.gray.opacity(0.15), radius: 15, x: 0, y: 5)
                    )
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $showLoginScreen) {
            LoginView()
        }
    }
    
    private func nextQuestion() {
        if currentPage < questions.count - 1 {
            withAnimation(.spring()) {
                currentPage += 1
                progress = CGFloat(currentPage + 1) / CGFloat(questions.count)
            }
        } else {
            calculateResult()
            showLoginScreen = true
        }
    }
    
    private func updateScore(for question: SurveyQuestion, isPositive: Bool) {
        if isPositive {
            scores[question.positiveType, default: 0] += 1
            scores[question.negativeType, default: 0] -= 1
        } else {
            scores[question.positiveType, default: 0] -= 1
            scores[question.negativeType, default: 0] += 1
        }
    }
    
    private func calculateResult() {
        let result = [
            scores["F"]! > scores["C"]! ? "F" : "C",
            scores["A"]! > scores["T"]! ? "A" : "T",
            scores["H"]! > scores["S"]! ? "H" : "S",
            scores["V"]! > scores["P"]! ? "V" : "P"
        ].joined()
        
        UserDefaults.standard.set(result, forKey: "userFoodType")
    }
}

struct SurveyQuestion: Identifiable {
    let id = UUID()
    let text: String
    let positiveType: String
    let negativeType: String
    let subtitle: String
}

struct SurveySection {
    let title: String
    let questions: [SurveyQuestion]
}

struct CuteAnswerButton: View {
    let text: String
    let isPositive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.custom("DMSerifDisplay-Regular", size: 20))
            }
            .foregroundColor(isPositive ? .white : Color("lightRed"))
            .frame(width: 280, height: 60)
            .background(
                isPositive ? Color("lightRed") : Color.white
            )
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color("lightRed"), lineWidth: isPositive ? 0 : 2)
            )
            .shadow(color: isPositive ? Color("lightRed").opacity(0.3) : Color.gray.opacity(0.1),
                   radius: isPositive ? 8 : 4,
                   x: 0,
                   y: isPositive ? 4 : 2)
        }
    }
}

#Preview {
    SurveyView()
}

