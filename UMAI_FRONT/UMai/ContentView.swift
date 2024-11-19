//
//  ContentView.swift
//  UMai
//
//  Created by PeterPark on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            TabView {
                
                HomeView()
                    .tabItem {
                        Image(systemName: "doc.text.image")
                        Text("main")
                    }
                
                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet.circle.fill")
                        Text("Umai")
                    }
                
                PersonView()
                    .tabItem {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Text("Person")
                    }
            }
            .accentColor(Color("brown"))
        }
    }
}

#Preview {
    ContentView()
}
