//
//  NCreateNoteViewModel.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import Foundation

class NCreateNoteViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var bodyText: String = ""
    @Published var type: NCardType = .small
    @Published var isFavorite: Bool = false

    var isValid: Bool {
        guard !title.isEmpty else {
            return false
        }

        return true
    }

    func cleanData() {
        title = ""
        bodyText = ""
        type = .small
        isFavorite = false
    }

    func createNote() -> NCard? {
        guard isValid else {
            return nil
        }

        let newCard = NCard(title: title, text: bodyText, type: type, isFavorite: isFavorite)

        print("New card created! \(newCard)")

        cleanData()

        return newCard
    }
}
