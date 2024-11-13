//
//  NListView.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NListView: View {
    let cards: [NCard] = [
        NCard(title: "Card 1", text: "Texto del card 1", type: .small),
        NCard(title: "Card 2", text: "Texto del card 2", type: .medium),
        NCard(title: "Card 3", text: "Texto del card 3", type: .small),
        NCard(title: "Card 4", text: "Texto del card 4", type: .large),
    ]

    var body: some View {
        List {
            ForEach(cards) { card in
                NCardView(card: card)
                    .listRowInsets(.none)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }

}

#Preview {
    NListView()
}
