//
//  NListView.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NListView: View {
    @EnvironmentObject var appInfo: AppInfo
    @State var showCreateSheet: Bool = false
    @State var selectedCard: NCard?

    var forFavorites: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(forFavorites ? appInfo.favorites : appInfo.cards) { card in
                    Button {
                        selectedCard = card
                    } label: {
                        NCardView(card: card)
                    }
                    .listRowInsets(.none)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $showCreateSheet) {
                NCreateNoteView { card in
                    appInfo.createCard(card: card)
                    showCreateSheet = false
                }
            }
            .navigationDestination(item: $selectedCard) { card in
                NDetailView(card: card)
            }
            .navigationTitle("All Notes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    showCreateSheet = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.white)
                }
            }
            .toolbarBackground(Color.cyan.opacity(0.4), for: .navigationBar)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        }
    }

}

#Preview {
    NListView()
        .environmentObject(AppInfo())
}
