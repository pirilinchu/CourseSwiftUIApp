//
//  PickersPractice.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct PickersPractice: View {
    @State var date: Date = Date()
    @State var category: Int = 1
    @State var size: NCardType = .small

    var body: some View {
        DatePicker("", selection: $date, displayedComponents: [.date])
            .datePickerStyle(.wheel)
            .padding()

        Picker("Categoria", selection: $category) {
            Text("1").tag(1)
            Text("2").tag(2)
            Text("3").tag(3)
            Text("4").tag(4)
        }
        .pickerStyle(.segmented)

        Picker("Tamaños", selection: $size) {
            Text("Pequeño").tag(NCardType.small)
            Text("Mediano").tag(NCardType.medium)
            Text("Grande").tag(NCardType.large)
        }

    }
}

#Preview {
    PickersPractice()
}
