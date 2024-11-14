//
//  NDetailView.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NDetailView: View {
    @State var card: NCard

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(card.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(card.text)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding()
        .background(Color.cyan.opacity(0.2))
    }
}

#Preview {
    NDetailView(card: NCard(title: "Titulo", text: "Contenido", type: .small, isFavorite: false))
}
