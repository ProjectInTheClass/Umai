//
//  LoginView.swift
//  UMai
//
//  Created by PeterPark on 12/3/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: SurveyLoginViewModel
       
       var body: some View {
           VStack(spacing: 20) {
               Text("로그인")
                   .font(.largeTitle)
                   .padding(.bottom, 30)
               
               TextField("이메일", text: $viewModel.email)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .autocapitalization(.none)
               
               SecureField("비밀번호", text: $viewModel.password)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
               
               Button(action: viewModel.handleLogin) {
                   Text("로그인")
                       .font(.headline)
                       .foregroundColor(.white)
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(Color.blue)
                       .cornerRadius(10)
               }
               
               Button(action: {}) {
                   Text("계정이 없으신가요? 회원가입")
                       .foregroundColor(.blue)
               }
           }
           .padding()
       }
}
