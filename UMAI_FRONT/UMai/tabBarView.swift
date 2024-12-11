//
//  tabBarView.swift
//  UMai
//
//  Created by PeterPark on 11/27/24.
//

import SwiftUI

struct tabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            
            PersonView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    tabBarView()
}
