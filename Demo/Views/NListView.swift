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

    var body: some View {
        NavigationStack {
            List {
                ForEach(appInfo.cards) { card in
                    Button {
                        selectedCard = card
                    } label: {
                        NCardView(card: card)
                            .listRowInsets(.none)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $showCreateSheet) {
                NCreateNoteView { card in
                    appInfo.createCard(card: card)
                    showCreateSheet = false
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    Button("Create sheet") {
                        showCreateSheet = true
                    }
                }
            }
            .navigationDestination(item: $selectedCard) { card in
                NDetailView(card: card)
            }
        }
    }

}

#Preview {
    NListView()
        .environmentObject(AppInfo())
}
