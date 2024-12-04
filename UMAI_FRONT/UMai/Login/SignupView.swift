//
//  SignupView.swift
//  UMai
//
//  Created by PeterPark on 12/4/24.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject var viewModel: SurveyLoginViewModel
       
       var body: some View {
           VStack(spacing: 20) {
               Text("Sign up")
                   .font(.largeTitle)
                   .padding(.bottom, 30)
               
//               TextField("name", text: $viewModel.name)
//                   .textFieldStyle(RoundedBorderTextFieldStyle())
//                   .autocapitalization(.none)
               
               TextField("id", text: $viewModel.id)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .autocapitalization(.none)
               
               SecureField("password", text: $viewModel.password)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
               
               Button(action: viewModel.handleLogin) {
                   Text("Sign in")
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

//#Preview {
//    SignupView()
//}
