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
        NavigationView {
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
                            // Testing if it brings data from backend
                            Text("Number of restaurants: \(viewModel.restaurants.count)")

                            ForEach(viewModel.restaurants) { restaurant in
                                Text("Restaurant: \(restaurant.name)") // Show the name of each restaurant
                                    .font(.headline)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                viewModel.fetchRestaurants()
            }
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
                    Image(systemName: "photo") // Placeholder for the actual image URL
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
                    
                   /* Text("대표메뉴: \(restaurant.menu.joined(separator: ", "))")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(1)*/
                    
                    // Add Rating View
                    RatingView(label: "Taste", rating: restaurant.Taste)
                    RatingView(label: "Price", rating: restaurant.price)
                    RatingView(label: "Quantity", rating: restaurant.quantity)
                    RatingView(label: "Accessibility", rating: restaurant.accessibility)
                    RatingView(label: "Emotion", rating: restaurant.emotion)
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

struct DetailView: View {
    let restaurant: Restaurant
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Back Button
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .medium))
                    }
                    .padding(.top)
                    
                    // Restaurant Image placeholder
                    if let imageUrl = restaurant.foodImage {
                        AsyncImage(url: imageUrl) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 200)
                        }
                    } else {
                        Image("Sushi")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .clipped()
                    }
                    
                    // Rating and other details
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("star"))
                        Text("\(restaurant.Taste).9")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    }
                    
                    // Name and Location
                    Text(restaurant.name)
                        .font(.title)
                        .bold()
                    
                    Text(restaurant.location)
                        .foregroundColor(.gray)
                        .padding(.vertical)
                    
                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.custom("DMSerifDisplay-Regular", size: 18))
                            .bold()
                        
                        Text(restaurant.description)
                            .font(.custom("DMSerifDisplay-Italic", size: 16))
                            .foregroundColor(.gray)
                            .lineSpacing(4)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .background(Color("backgroundGray")) // ScrollView 배경색 설정
            
            // Bottom Section
            VStack(spacing: 12) {
                // Price
                HStack {
                    Text("$21.00")
                        .font(.custom("DMSerifDisplay-Italic", size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    Spacer()
                }
                .padding(.horizontal)
                
                // Add To Favorites Button
                Button(action: {
                    // Add to favorites action
                }) {
                    HStack {
                        Text("Add To Favorites")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 25)
                    .padding(.vertical, 15)
                    .background(
                        Capsule()
                            .fill(Color.white.opacity(0.2))
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .background(Color("lightRed"))
        }
        .navigationBarHidden(true)
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
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
