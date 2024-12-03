//
//  LoginPageView.swift
//  UMai
//
//  Created by  전주환 on 12/3/24.
//

import SwiftUI

struct LoginPageView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email")
                        .font(.headline)
                    TextField("Enter your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Password")
                        .font(.headline)
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    handleLogin()
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                    NavigationLink("Sign Up", destination: SignUpPageView())
                }
                .font(.footnote)
            }
            .padding()
            .navigationTitle("Welcome")
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Login Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func handleLogin() {
        if email.isEmpty || password.isEmpty {
            alertMessage = "Please enter both email and password."
        } else if email == "test@example.com" && password == "password123" {
            alertMessage = "Login successful!"
        } else {
            alertMessage = "Invalid email or password."
        }
        isShowingAlert = true
    }
}

struct SignUpPageView: View {
    var body: some View {
        Text("Sign Up Page Placeholder")
            .font(.largeTitle)
            .padding()
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}

#Preview {
    LoginPageView()
}
