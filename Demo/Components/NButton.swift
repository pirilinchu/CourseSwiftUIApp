//
//  NButton.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct NButton: View {
    var body: some View {
        Text("Press me")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
        Text("Press me")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray)
            .cornerRadius(8)
    }
}

#Preview {
    NButton()
}
