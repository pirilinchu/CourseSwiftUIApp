//
//  TextFieldPractice.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct TextFieldPractice: View {
    @State var name: String = ""
    @State var color: Color = Color.gray.opacity(0.2)

    var body: some View {
        TextField("Name", text: $name)
            .font(.headline)
            .padding()
            .background(color)
            .cornerRadius(8)
            .onChange(of: name) { _, newValue in
                if newValue.count > 10 {
                    color = .red
                } else {
                    color = .gray.opacity(0.2)
                }
            }
        
        TextEditor(text: $name)
            .font(.headline)
            .padding()
            .background(color)
            .cornerRadius(8)
            .scrollContentBackground(.hidden)
    }
}

#Preview {
    TextFieldPractice()
        .padding()
}
