//
//  NButton.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NButton: View {
    let title: String
    let isValid: Bool
    let onTap: () -> Void

    var body: some View {
        Button {
            onTap()
        } label: {
            Text(title)
                .font(.headline)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isValid ? Color.blue : Color.gray)
                .cornerRadius(8)
        }
        .disabled(!isValid)
    }
}

#Preview {
    VStack {
        NButton(title: "Button", isValid: true) {}
        NButton(title: "Button", isValid: false) {}
    }
}
