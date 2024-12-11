//
//  DetailView.swift
//  UMai
//
//  Created by PeterPark on 12/10/24.
//

import SwiftUI

struct DetailView: View {
    let restaurant: Restarurant
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("backgroundGray")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        // Back Button
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                HStack(spacing: 5) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .medium))
                                    
                                }
                                .padding(8)
                                
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                        
                        // Restaurant Image
                        Image(restaurant.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .clipped()
                        
                        //rating
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("star"))
                            Text("\(restaurant.Taste).9")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                        // Name and Location
                        Text(restaurant.name)
                            .font(.title)
                            .bold()
                            .padding(.horizontal)
                        
                        Text(restaurant.location)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                        
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
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                }
                
                // Bottom Section
                VStack(spacing: 12) {
                    // Price
                    HStack {
                        Text("$\(restaurant.price * 5).00")
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
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}

