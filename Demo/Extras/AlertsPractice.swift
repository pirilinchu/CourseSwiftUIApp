//
//  AlertsPractice.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct AlertsPractice: View {
    @State var showAlert: Bool = false
    @State var showSheet: Bool = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                showAlert = true
            }
            Button("Show Sheet") {
                showSheet = true
            }
        }
        .alert("Esta es una alerta de prueba", isPresented: $showAlert) {
            Button("Aceptar") {
                print("Aceptar alerta")
            }
            Button("Cancelar") {
                print("Cancelar alerta")
            }
        }
        .sheet(isPresented: $showSheet) {
            NCreateNoteView()
        }
    }
}

#Preview {
    AlertsPractice()
}
