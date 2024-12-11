//
//  ListView.swift
//  UMai
//
//  Created by PeterPark on 11/27/24.
//

import SwiftUI

struct ListView: View {
    @StateObject private var viewModel = RestaurantViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundGray")
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("Umai Picks")
                            .font(.system(size: 33))
                            .bold()
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("star"))
                        
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(viewModel.restaurants) { restaurant in
                                NavigationLink(value: restaurant) {
                                    RestaurantCard(restaurant: restaurant)
                                }
                            }
                        }
                        .padding()
                        .padding(.bottom, 65)
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                viewModel.fetchRestaurants()
            }
//            .navigationDestination(for: Restaurant.self) { restaurant in
//                DetailView(restaurant: restaurant)
//            }
        }
    }
}

struct RestaurantCard: View {
    let restaurant: Restaurant
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color("White"))
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
            .frame(height: 300)
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Image("Sushi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .clipped()
                    
                    HStack {
                        Text(restaurant.name)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    Text(restaurant.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("대표메뉴: \(restaurant.menu)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                .padding()
            )
    }
}

struct RatingView: View {
    let label: String
    let rating: Int
    
    var body: some View {
        VStack(spacing: 2) {
            Text(label)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            
            HStack(spacing: 2) {
                ForEach(0..<rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .font(.system(size: 8))
                        .foregroundColor(Color("yC"))
                }
            }
        }
    }
}



struct RatingDetailView: View {
    let label: String
    let rating: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Text("\(rating)")
                .font(.system(size: 16, weight: .bold))
        }
    }
}

#Preview {
    ListView()
}
