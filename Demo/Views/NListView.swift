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

    var body: some View {
        List {
            ForEach(appInfo.cards) { card in
                NCardView(card: card)
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
        .overlay {
            VStack {
                Spacer()
                Button("Create sheet") {
                    showCreateSheet = true
                }
            }
        }
    }

}

#Preview {
    NListView()
        .environmentObject(AppInfo())
}
