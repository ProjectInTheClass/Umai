//
//  UserViewModel.swift
//  UMai
//
//  Created by 김진태 on 11/28/24.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var userInfo: [String: Any] = [:] // 사용자 정보를 저장할 Dictionary

    // Function to send user registration request
    func registerUser(user_name : String, id: String, password: String, mbti: String, matBTI: String) {
        guard let url = URL(string: "http://localhost:3333/auth/join") else {
            print("Invalid URL")
            return
        }
        
        // Create the request body
        let requestBody: [String: Any] = [
            "id": id,
            "password": password,
            "nickname": user_name,
            "MBTI": mbti,
            "matBTI": matBTI,
        ]
        
        // Convert the dictionary to JSON data
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            print("Failed to encode request body")
            return
        }
        
        // Create a POST request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Send the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending request: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            // Debug: Check status code
            print("HTTP Response Status Code: \(httpResponse.statusCode)")
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Debug: Check raw response data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response data: \(jsonString)")
            }
            
            // Handle the response
            if httpResponse.statusCode == 201 {
                print("User registered successfully!")
            } else {
                print("Failed to register user. Status code: \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
    }
    
    func loginUser(id: String, password: String) {
        guard let url = URL(string: "http://localhost:3333/auth/login") else {
            print("Invalid URL")
            return
        }
        
        let requestBody: [String: Any] = [
            "id": id,
            "password": password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            print("Failed to encode request body")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending request: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            if httpResponse.statusCode == 200,
               let data = data,
               let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let token = jsonResponse["token"] as? String {
                print("Login successful! Token: \(token)")
                UserDefaults.standard.set(token, forKey: "authToken")
            } else {
                let errorMessage = "Login failed. Status code: \(httpResponse.statusCode)"
                print(errorMessage)
            }
        }
        task.resume()
    }
    
    func getUserInfo(token: String) {
            guard let url = URL(string: "http://localhost:3333/auth/me") else {
                print("Invalid URL")
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization") // Bearer token 방식 사용
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error fetching user info: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    return
                }
                
                if httpResponse.statusCode == 200,
                   let data = data,
                   let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // 사용자 정보를 업데이트
                    DispatchQueue.main.async {
                        self.userInfo = jsonResponse
                    }
                    print("User info fetched successfully")
                    print(jsonResponse)
                } else {
                    print("Failed to fetch user info. Status code: \(httpResponse.statusCode)")
                    print("Token sent in Authorization header: Bearer \(token)")
                }
            }
            task.resume()
        }




}
