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
        VStack {
            NListView()
        }
        .environmentObject(appInfo)
    }
}

#Preview {
    ContentView()
}
