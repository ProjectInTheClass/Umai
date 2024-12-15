//
//  SignupView.swift
//  UMai
//
//  Created by PeterPark on 12/4/24.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showHomeView = false
    @State private var showSignUpView = false
    @State private var showLoginView = false
    @State private var id: String = ""
    @State private var name: String = ""
    @State private var mbti: String = ""
    @StateObject private var userViewModel = UserViewModel()
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @Binding var matBTI: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundGray")
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Logo
                    Text("Umai")
                        .font(.custom("DMSerifDisplay-Regular", size: 45))
                        .foregroundColor(Color("lightRed"))
                        .padding(.top, 100)
                    
                    // Login Form
                    VStack(spacing: 20) {
                        // Email Field
                        S_CustomTextField(
                            placeholder: "ID",
                            text: $id,
                            imageName: "person.fill"
                        )
                        
                        S_CustomSecureField(
                            placeholder: "Password",
                            text: $password,
                            imageName: "lock.fill"
                        )
                        
                        S_CustomTextField(
                            placeholder: "Name",
                            text: $name,
                            imageName: "poweroutlet.type.f.fill"
                        )
                        
                        S_CustomTextField(
                            placeholder: "MBTI",
                            text: $mbti,
                            imageName: "character.bubble.fill"
                        )
                        
                        
                        // 회원가입 Button
                        Button(action: {
//                            handleSignUp()
                            // Call registerUser method
                            userViewModel.registerUser(
                                user_name: name,
                                id: id,
                                password: password,
                                mbti: mbti,
                                matBTI: matBTI
                            )
                            showLoginView = true
                        }) {
                            Text("SignUP")
                                .font(.custom("DMSerifDisplay-Regular", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color("lightRed"))
                                .cornerRadius(25)
                        }
                        .padding(.top)
                        
                        // Divider
                        HStack {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray.opacity(0.3))
                            
                            Text("or")
                                .font(.custom("DMSerifDisplay-Regular", size: 16))
                                .foregroundColor(.gray)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray.opacity(0.3))
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
            }
            .fullScreenCover(isPresented: $showLoginView) {
                LoginView()
            }
        }
    }
    
    private func handleSignUp() {
        // Add your login logic here
        // For now, we'll just navigate to HomeView
        
        // Call registerUser method
 
        showLoginView = true
    }
}

// Custom TextField with icon
struct S_CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.gray)
                .frame(width: 20)
                .padding(.leading, 20)
            
            TextField(placeholder, text: $text)
                .font(.custom("DMSerifDisplay-Regular", size: 16))
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
        }
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

// Custom Secure Field with icon
struct S_CustomSecureField: View {
    let placeholder: String
    @Binding var text: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.gray)
                .frame(width: 20)
                .padding(.leading, 20)
            
            SecureField(placeholder, text: $text)
                .font(.custom("DMSerifDisplay-Regular", size: 16))
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
        }
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    LoginView()
}

