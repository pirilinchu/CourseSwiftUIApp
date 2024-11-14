//
//  NCreateNoteView.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NCreateNoteView: View {
    @StateObject private var viewModel = NCreateNoteViewModel()
    @State private var showHeart: Bool = false

    var onNoteCreated: ((NCard) -> Void)?

    func createNote() {
        if let newCard = viewModel.createNote() {
            onNoteCreated?(newCard)
        }
    }

    var body: some View {
        ScrollView {
            VStack {
                Text("Crear Nueva Nota")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
                TextField("Titulo", text: $viewModel.title)
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                TextEditor(text: $viewModel.bodyText)
                    .scrollContentBackground(.hidden)
                    .font(.body)
                    .frame(height: 150)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                HStack {
                    Text("Tamaño")
                    Spacer()
                    Picker("Tipo de Nota", selection: $viewModel.type) {
                        Text("Pequeño").tag(NCardType.small)
                        Text("Mediano").tag(NCardType.medium)
                        Text("Grande").tag(NCardType.large)
                    }
                    .pickerStyle(.menu)
                }
                .padding()
                Toggle(isOn: $viewModel.isFavorite) {
                    Text("Marcar como Favorito")
                        .font(.headline)
                }
                .padding()
                NButton(title: "Guardar Nota", isValid: viewModel.isValid) {
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
        .overlay {
            if showHeart {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundStyle(Color.red)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
                    .onAppear {
                        let delay = DispatchTime.now() + 1
                        DispatchQueue.main.asyncAfter(deadline: delay) {
                            withAnimation {
                                showHeart = false
                            }
                        }
                    }
            }
        }
        .onChange(of: viewModel.isFavorite) { _, newValue in
            if newValue == true {
                withAnimation {
                    showHeart = true
                }
            }
        }
    }
}

#Preview {
    NCreateNoteView()
}
