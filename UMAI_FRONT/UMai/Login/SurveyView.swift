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
    @State private var showMatBTIScreen = false
    @State private var progress: CGFloat = 0
    
    let questions = [
        SurveySection(title: "맛의 취향", questions: [
            SurveyQuestion(text: "매운 음식을 보면 꼭 한번 도전해보고 싶다.", positiveType: "F", negativeType: "C", subtitle: "맛의 취향")
        ]),
        SurveySection(title: "맛의 취향", questions: [
            SurveyQuestion(text: "강한 양념보다는 깔끔한 본연의 맛을 더 즐긴다.", positiveType: "C", negativeType: "F", subtitle: "맛의 취향")
        ]),
        SurveySection(title: "맛의 취향", questions: [
            SurveyQuestion(text: "단맛이 강한 디저트가 항상 끌린다.", positiveType: "F", negativeType: "C", subtitle: "맛의 취향")
        ]),
        SurveySection(title: "맛의 취향", questions: [
            SurveyQuestion(text: "짠 음식은 조금 부담스러워서 자주 먹지 않는다.", positiveType: "C", negativeType: "F", subtitle: "맛의 취향")
        ]),
        SurveySection(title: "맛의 취향", questions: [
            SurveyQuestion(text: "진한 양념으로 맛을 낸 고기가 순한 국물요리보다 더 맛있다.", positiveType: "F", negativeType: "C", subtitle: "맛의 취향")
        ]),
        SurveySection(title: "도전 정신", questions: [
            SurveyQuestion(text: "새로운 음식이 눈에 띄면 바로 먹어보고 싶다.", positiveType: "A", negativeType: "T", subtitle: "도전 정신")
        ]),
        SurveySection(title: "도전 정신", questions: [
            SurveyQuestion(text: "외국 요리보다는 한식이 더 편하고 익숙하다.", positiveType: "T", negativeType: "A", subtitle: "도전 정신")
        ]),
        SurveySection(title: "도전 정신", questions: [
            SurveyQuestion(text: "퓨전 음식보다는 전통 요리가 더 끌린다.", positiveType: "A", negativeType: "T", subtitle: "도전 정신")
        ]),
        SurveySection(title: "도전 정신", questions: [
            SurveyQuestion(text: "내가 모르는 재료가 들어간 음식을 먹는 것이 흥미롭다.", positiveType: "A", negativeType: "T", subtitle: "도전 정신")
        ]),
        SurveySection(title: "도전 정신", questions: [
            SurveyQuestion(text: "새로운 음식점보다는 항상 가던 음식점에 가는 것이 더 좋다.", positiveType: "T", negativeType: "A", subtitle: "도전 정신")
        ]),
        SurveySection(title: "식감 선호도", questions: [
            SurveyQuestion(text: "바삭한 식감의 간식을 더 선호한다.", positiveType: "H", negativeType: "S", subtitle: "식감 선호도")
        ]),
        SurveySection(title: "식감 선호도", questions: [
            SurveyQuestion(text: "부드러운 디저트를 먹으면 기분이 더 좋아진다.", positiveType: "S", negativeType: "H", subtitle: "식감 선호도")
        ]),
        SurveySection(title: "식감 선호도", questions: [
            SurveyQuestion(text: "단단한 빵보다 말랑한 빵을 더 자주 고른다.", positiveType: "S", negativeType: "H", subtitle: "식감 선호도")
        ]),
        SurveySection(title: "식감 선호도", questions: [
            SurveyQuestion(text: "크림처럼 부드러운 식감보다 씹히는 재미가 있는 음식이 더 좋다.", positiveType: "H", negativeType: "S", subtitle: "식감 선호도")
        ]),
        SurveySection(title: "식감 선호도", questions: [
            SurveyQuestion(text: "튀김 요리는 바삭할수록 더 맛있다고 생각한다.", positiveType: "H", negativeType: "S", subtitle: "식감 선호도")
        ]),
        SurveySection(title: "가치 기준", questions: [
            SurveyQuestion(text: "분위기보다는 음식의 가격대비 양이 더 중요하다.", positiveType: "V", negativeType: "P", subtitle: "가치 기준")
        ]),
        SurveySection(title: "가치 기준", questions: [
            SurveyQuestion(text: "고급 레스토랑에서의 특별한 경험이 값진 돈이라고 생각한다.", positiveType: "P", negativeType: "V", subtitle: "가치 기준")
        ]),
        SurveySection(title: "가치 기준", questions: [
            SurveyQuestion(text: "음식의 맛보다 가격이 비싸면 가성비가 떨어진다고 느낀다.", positiveType: "V", negativeType: "P", subtitle: "가치 기준")
        ]),
        SurveySection(title: "가치 기준", questions: [
            SurveyQuestion(text: "분위기 좋은 곳에서 느긋하게 식사하는 것을 즐긴다.", positiveType: "P", negativeType: "V", subtitle: "가치 기준")
        ]),
        SurveySection(title: "가치 기준", questions: [
            SurveyQuestion(text: "한 끼를 해결할 수 있는 저렴한 배달 음식을 더 자주 이용한다.", positiveType: "V", negativeType: "P", subtitle: "가치 기준")
        ]),
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
                    
                    Text("\(currentPage + 1)/20")
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
        .fullScreenCover(isPresented: $showMatBTIScreen) {
            MatBtiResultView()
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
            showMatBTIScreen = true
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
        //Debugging
        print("Scores: F=\(scores["F"]!), C=\(scores["C"]!), A=\(scores["A"]!), T=\(scores["T"]!), H=\(scores["H"]!), S=\(scores["S"]!), V=\(scores["V"]!), P=\(scores["P"]!)")
        
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

