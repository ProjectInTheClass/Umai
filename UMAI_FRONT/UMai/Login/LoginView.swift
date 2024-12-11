//
//  LoginView.swift
//  UMai
//
//  Created by PeterPark on 12/3/24.
//

import SwiftUI
//id pw user_name nickname

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showHomeView = false
    @State private var showSignUpView = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
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
                        CustomTextField(
                            placeholder: "Email",
                            text: $email,
                            imageName: "envelope.fill"
                        )
                        
                        // Password Field
                        CustomSecureField(
                            placeholder: "Password",
                            text: $password,
                            imageName: "lock.fill"
                        )
                        
                        // Login Button
                        Button(action: {
                            handleLogin()
                        }) {
                            Text("Login")
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
                        
                        // Sign Up Button
                        Button(action: {
                            showSignUpView = true
                        }) {
                            Text("Sign Up")
                                .font(.custom("DMSerifDisplay-Regular", size: 20))
                                .foregroundColor(Color("lightRed"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(.white)
                                .cornerRadius(25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color("lightRed"), lineWidth: 1)
                                )
                        }
                        
                        // Forgot Password
                        Button(action: {
                            // Handle forgot password
                        }) {
                            Text("Forgot Password?")
                                .font(.custom("DMSerifDisplay-Regular", size: 16))
                                .foregroundColor(.gray)
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
            }
            .fullScreenCover(isPresented: $showHomeView) {
                ContentView()
            }
            .fullScreenCover(isPresented: $showSignUpView) {
                SignupView()
            }
            .alert("Error", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func handleLogin() {
        // Add your login logic here
        // For now, we'll just navigate to HomeView
        showHomeView = true
    }
}

// Custom TextField with icon
struct CustomTextField: View {
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
struct CustomSecureField: View {
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