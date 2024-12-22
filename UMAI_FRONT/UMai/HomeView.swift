//
//  HomeView.swift
//  UMai
//
//  Created by PeterPark on 11/27/24.
//

import SwiftUI

struct HomeView: View {
    @State private var userFoodType: String = ""
    @State private var selectedTab = "MatBTI"
    @StateObject private var viewModel = RestaurantViewModel()
    let tabs = ["MatBTI", "Local", "Popular"]
    
    var body: some View {
        
        let menuDictionary: [String: [Restaurant]] = [
            "FAHV": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "Rice Cake Heaven"
            },
            "FAHP": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "HotPot Palace" || restaurant.name == "Ramen King"
            },
            "FASV": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "HotPot Palace" || restaurant.name == "Omurice Factory"
            },
            "FASP": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "Ramen King" || restaurant.name == "Deopbap House"
            },
            "FTHV": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" || restaurant.name == "Rick Cake Heaven"
            },
            "FTHP": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "Ramen King" || restaurant.name == "Yakisoba Street"
            },
            "FTSV": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "HotPot Palace" || restaurant.name == "Omurice Factory"
            },
            "FTSP": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "Ramen King" || restaurant.name == "Deopbap House"
            },
            "CAHV": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" // Only show So Pheon for FAHV
            },
            "CAHP": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" // Only show So Pheon for FAHV
            },
            "CASV": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" // Only show So Pheon for FAHV
            },
            "CASP": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" // Only show So Pheon for FAHV
            },
            "CTHV": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" // Only show So Pheon for FAHV
            },
            "CTHP": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" // Only show So Pheon for FAHV
            },
            "CTSV": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" // Only show So Pheon for FAHV
            },
            "CTSP": viewModel.restaurants.filter { restaurant in
                return restaurant.name == "So Pheon" // Only show So Pheon for FAHV
            }
        ]
        
        // Retrieve the restaurants based on userFoodType, defaulting to all restaurants if the type is not found
            let filteredRestaurants = menuDictionary[userFoodType] ?? viewModel.restaurants
        
        ZStack {
            Color("backgroundGray")
                .ignoresSafeArea(.all)
            
            
            ScrollView(.vertical, showsIndicators: false)
            {
                //header
                VStack {
                    //app name
                    HStack() {
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Text("Umai")
                            .font(.custom("DMSerifDisplay-Regular", size: 34))
                        
                        Spacer()
                        
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                }
                
                //맛BTI
                VStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 23)
                        .fill(Color("lightRed"))
                        .frame(width: 367, height: 185)
                        .overlay(
                            HStack {
                                VStack {
                                    Text("\(userFoodType)") //Liquefier //DMSerifDisplay-Italic //DMSerifDisplay-Regular
                                        .foregroundColor(Color("White"))
                                        .font(.custom("DMSerifDisplay-Regular", size: 34))
                                        .offset(x: -60, y: -24)
                                    
                                    Text("The food is familiar and upscale, with an emphasis on quality.")
                                        .font(.custom("DMSerifDisplay-Italic", size: 14))
                                        .frame(width: 200)
                                        .foregroundColor(Color("backgroundGray"))
                                }
                                
                                Image("deopbap")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            }
                        )
                }
                .onAppear {
                    if let storedFoodType = UserDefaults.standard.string(forKey: "userFoodType") {
                        userFoodType = storedFoodType
                    }
                }
                
                // 텝 세션들
                VStack {
                    
                    //추천 클씨
                    HStack {
                        Text("Recommend")
                            .font(.custom("DMSerifDisplay-Regular", size: 27))
                        
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(tabs, id: \.self) { tab in
                                RoundedRectangle(cornerRadius: 23)
                                    .fill(selectedTab == tab ? Color("lightRed") : Color("White"))
                                    .frame(width: 100, height: 38)
                                    .overlay(
                                        Text(tab)
                                            .foregroundColor(selectedTab == tab ? Color("White") : Color("lightRed"))
                                            .font(.custom("DMSerifDisplay-Regular", size: 20))
                                    )
                                    .onTapGesture {
                                        selectedTab = tab
                                    }
                            }
                        }
                        .padding(.leading, 34)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            switch selectedTab {
                            case "MatBTI":
                                ForEach(filteredRestaurants) { restaurant in
                                    NavigationLink(value: restaurant) {
                                        FoodCard(restaurant: restaurant)
                                    }
                                }
                            case "Local":
                                ForEach(viewModel.restaurants) { restaurant in
                                    NavigationLink(value: restaurant) {
                                        FoodCard(restaurant: restaurant)
                                    }
                                }
                            case "Popular":
                                ForEach(viewModel.restaurants) { restaurant in
                                    NavigationLink(value: restaurant) {
                                        FoodCard(restaurant: restaurant)
                                    }
                                }
                            default:
                                EmptyView()
                            }
                        }
                        .padding(.horizontal)
                        .onAppear {
                            viewModel.fetchRestaurants()
                        }
                    }
                }
            }
        }
    }
}

struct FoodCard: View {
    let restaurant: Restaurant
    
    private var averageRating: Double {
           let total = restaurant.Taste + restaurant.price + restaurant.accessibility + restaurant.emotion + restaurant.quantity
           return Double(total) / 5.0
       }
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180)
                .padding(.top, 8)
            
            Text(restaurant.name)
                .font(.custom("DMSerifDisplay-Regular", size: 18))
                .padding(.top, 8)
            
            HStack {
                Text("$\(restaurant.price * 5).00")
                    .font(.custom("DMSerifDisplay-Regular", size: 16))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text(String(format: "%.1f", averageRating))
                    .font(.system(size: 14))
            }
        }
        .frame(width: 160)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.top)
    }
    
}

#Preview {
    HomeView()
}
