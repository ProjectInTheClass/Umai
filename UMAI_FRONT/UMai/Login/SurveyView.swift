//
//  SurveyView.swift
//  UMai
//
//  Created by PeterPark on 12/3/24.
//

import SwiftUI

struct SurveyView: View {
    @ObservedObject var viewModel: SurveyLoginViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            ProgressView(value: Double(viewModel.currentQuestionIndex + 1), total: Double(viewModel.questions.count))
                .padding()
            
            Text("질문 \(viewModel.currentQuestionIndex + 1)/\(viewModel.questions.count)")
                .font(.headline)
            
            Text(viewModel.questions[viewModel.currentQuestionIndex].question)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            TextField("답변을 입력해주세요", text: $viewModel.questions[viewModel.currentQuestionIndex].answer)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: viewModel.nextQuestion) {
                Text(viewModel.currentQuestionIndex == viewModel.questions.count - 1 ? "완료" : "다음")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}
