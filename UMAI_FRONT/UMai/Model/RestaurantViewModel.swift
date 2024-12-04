//
//  RestaurantViewModel.swift
//  UMai
//
//  Created by 전주환 on 11/28/24.
//

import Foundation
import SwiftUI

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []

    // Make an API call to fetch restaurant data
    func fetchRestaurants() {
        guard let url = URL(string: "http://localhost:3333/api/restaurants") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            // Debug: Check raw data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received data: \(jsonString)")
            }

            // Decode the data into your model
            do {
                let decoder = JSONDecoder()
                let fetchedRestaurants = try decoder.decode([Restaurant].self, from: data)
                DispatchQueue.main.async {
                    self.restaurants = fetchedRestaurants
                    print("Fetched restaurants: \(fetchedRestaurants)") // Debug: Check fetched data
                }
            } catch {
                print("Failed to decode data: \(error)")
            }
        }

        task.resume()
    }
}
