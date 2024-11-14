//
//  NCreateNoteView.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NCreateNoteView: View {
    @State private var title: String = ""
    @State private var bodyText: String = ""
    @State private var type: NCardType = .small
    @State private var isFavorite: Bool = false

    var onNoteCreated: ((NCard) -> Void)?

    var isValid: Bool {
        guard !title.isEmpty else {
            return false
        }

        return true
    }

    func createNote() {
        guard isValid else {
            return
        }

        let newCard = NCard(title: title, text: bodyText, type: type, isFavorite: isFavorite)

        print("New card created! \(newCard)")

        cleanData()
        onNoteCreated?(newCard)
    }

    func cleanData() {
        title = ""
        bodyText = ""
        type = .small
        isFavorite = false
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Crear Nueva Nota")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                TextField("Titulo", text: $title)
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                TextEditor(text: $bodyText)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .frame(height: 150)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                HStack {
                    Text("Tamaño")
                    Spacer()
                    Picker("Tipo de Nota", selection: $type) {
                        Text("Pequeño").tag(NCardType.small)
                        Text("Mediano").tag(NCardType.medium)
                        Text("Grande").tag(NCardType.large)
                    }
                    .pickerStyle(.menu)
                }
                .padding()
                Toggle(isOn: $isFavorite) {
                    Text("Marcar como Favorito")
                        .font(.headline)
                }
                .padding()
                NButton(title: "Guardar Nota", isValid: isValid) {
                    createNote()
                }
                .padding(.top, 20)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding()
        .background(Color.cyan.opacity(0.2))
    }
}

#Preview {
    NCreateNoteView()
}
