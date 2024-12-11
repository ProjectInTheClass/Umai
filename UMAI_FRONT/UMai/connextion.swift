import Foundation

// UserResponse 모델
struct UserResponse: Codable {
    let data: UserData
    let support: SupportInfo
}

struct UserData: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String

    // JSON 키와 Swift 변수명이 다를 경우 매핑
    enum CodingKeys: String, CodingKey {
        case id, email, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
}

struct SupportInfo: Codable {
    let url: String
    let text: String
}

// ErrorMessage 모델
struct ErrorMessage: Codable {
    let error: String
}

// fetchUserData 함수
func fetchUserData() {
    // URL 생성
    guard let url: URL = URL(string: "https://reqres.in/api/users/2") else {
        debugPrint("URL is not correct")
        return
    }

    // URLRequest 설정
    var request: URLRequest = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    // URLSession 생성 (기본 세션)
    let session: URLSession = URLSession(configuration: .default)

    // dataTask
    session.dataTask(with: request) { (data, response, error) in
        let successRange: Range = (200..<300)

        // 통신 성공
        guard let data: Data = data,
              error == nil else {
            debugPrint("Error: \(error?.localizedDescription ?? "Unknown error")")
            return
        }

        if let response: HTTPURLResponse = response as? HTTPURLResponse {
            debugPrint("status code: \(response.statusCode)")

            // 요청 성공 (StatusCode가 200번대)
            if successRange.contains(response.statusCode) {
                // decode
                guard let userInfo: UserResponse = try? JSONDecoder().decode(UserResponse.self, from: data) else {
                    debugPrint("Decoding UserResponse failed")
                    return
                }
                debugPrint("User Info:", userInfo)
            } else { // 요청 실패 (Status code가 200대 아님)
                guard let errorMessage: ErrorMessage = try? JSONDecoder().decode(ErrorMessage.self, from: data) else {
                    debugPrint("Decoding ErrorMessage failed")
                    return
                }
                debugPrint("Error Message:", errorMessage.error)
            }
        }
    }.resume()
}

//// 함수 호출
//fetchUserData()
