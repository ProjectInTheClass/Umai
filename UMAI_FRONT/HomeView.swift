//
//  HomeView.swift
//  UMai
//
//  Created by PeterPark on 10/8/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    var body: some View {
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
                
                //맛bTI
                VStack(spacing: 30) {
                    RoundedRectangle(cornerRadius: 23)
                        .fill(Color("lightRed"))
                        .frame(width: 367, height: 185)
                        .overlay(
                            HStack {
                                VStack {
                                    Text("CTSP") //Liquefier //DMSerifDisplay-Italic //DMSerifDisplay-Regular
                                        .foregroundColor(Color("White"))
                                        .font(.custom("DMSerifDisplay-Regular", size: 34))
                                        .offset(x: -60, y: -24)
                                    
                                    Text("The food is familiar and upscale, with an emphasis on quality.")
                                        .font(.custom("DMSerifDisplay-Italic", size: 14))
                                        .frame(width: 200)
                                }
                                
                                Image("deopbap")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            }
                        )
                }
                
                
                //change 맛BTI
                HStack {
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 23)
                        .fill(Color("lightRed"))
                        .frame(width: 130, height: 80)
                }
                
                //category
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(Color("White"))
//                            .frame(width: 100, height: 40)
//                            .overlay(Text("Local").font(.title3))
//                        
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(Color("White"))
//                            .frame(width: 100, height: 40)
//                            .overlay(Text("MSFP").font(.title3))
//                        
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(Color("White"))
//                            .frame(width: 100, height: 40)
//                            .overlay(Text("Favorites").font(.title3))
//                    }
//                    .padding()
//                }
                
            //
            }
        }
    }
}

#Preview {
    HomeView()
}

struct Categoly: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("MSFP")
                    .bold()
                    .padding()
                    
                    .background(.white)
                    .frame(height: 40)
                    .cornerRadius(16)
                
                Text("Local")
                    .bold()
                    .padding()
                    .background(Color.white)
                    .frame(height: 40)
                    .cornerRadius(16)
                
                Text("Umai")
                    .bold()
                    .padding()
                    .background(Color.white)
                    .frame(height: 40)
                    .cornerRadius(16)
                
                Text("Popular")
                    .bold()
                    .padding()
                    .background(Color.white)
                    .frame(height: 40)
                    .cornerRadius(16)
            }
            .font(Font.custom("Poppins-ExtraLightItalic", size: 15))
            .padding(.horizontal)
            .padding(.vertical)
        }
    }
}
