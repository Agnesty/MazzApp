//
//  ContentView.swift
//  MazzApp
//
//  Created by Phincon on 23/07/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            TrendingView()
                .tabItem {
                    Label("Trending", systemImage: "flame")
                }
            
            LiveView()
                .tabItem {
                    Label("Live", systemImage: "play.square.stack")
                }
            
            NotificationView()
                .tabItem {
                    Label("Notification", systemImage: "heart")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}


#Preview {
    TabBarView()
}
