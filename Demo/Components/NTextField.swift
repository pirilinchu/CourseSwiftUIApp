//
//  NTextField.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NTextField: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .font(.headline)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}

#Preview {
    VStack {
        NTextField(placeholder: "Placeholder", text: .constant("Prueba"))
        NTextField(placeholder: "Placeholder", text: .constant(""))
    }
    .padding()
}
