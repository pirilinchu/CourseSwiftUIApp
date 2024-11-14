//
//  ContentView.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appInfo = AppInfo()

    var body: some View {
        TabView {
            NListView()
                .tabItem { Label("Home", systemImage: "list.bullet") }
                .toolbarBackgroundVisibility(.hidden, for: .tabBar)
            NListView(forFavorites: true)
                .tabItem { Label("Favorites", systemImage: "heart.fill") }
        }
        .tabViewStyle(.tabBarOnly)
        .environmentObject(appInfo)
    }
}

#Preview {
    ContentView()
}
