//
//  LoginView.swift
//  UMai
//
//  Created by PeterPark on 12/3/24.
//

import SwiftUI
//id pw user_name nickname

struct LoginView: View {
    @ObservedObject var viewModel: SurveyLoginViewModel
       
       var body: some View {
           VStack(spacing: 20) {
               
               
               Text("Sign up")
                   .font(.largeTitle)
                   .padding(.bottom, 30)
               
               TextField("id", text: $viewModel.id)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .autocapitalization(.none)
               
               SecureField("password", text: $viewModel.password)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
               
               TextField("name", text: $viewModel.user_name)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .autocapitalization(.none)
               
               
               TextField("nick", text: $viewModel.nickname)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .autocapitalization(.none)
               
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
