//
//  RestaurantViewModel.swift
//  UMai
//
//  Created by  전주환 on 12/10/24.
//

import Foundation

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restarurant] = []

    func fetchRestaurants() {
        guard let url = URL(string: "http://localhost:3333/api/restaurants") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching restaurants: \(error.localizedDescription)")
                return
            }

            guard let data = data else { return }

            do {
                let decodedData = try JSONDecoder().decode([Restarurant].self, from: data)
                DispatchQueue.main.async {
                    self.restaurants = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
