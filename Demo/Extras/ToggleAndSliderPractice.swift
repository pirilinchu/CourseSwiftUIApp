//
//  ToggleAndSliderPractice.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct ToggleAndSliderPractice: View {
    @State var age: Double = 18
    @State var isOver18: Bool = false

    var body: some View {
        VStack {
            Text("Age: \(age.formatted(.number))")
            Slider(value: $age, in: 1...100, step: 1)

            Toggle("Es mayor de edad", isOn: $isOver18)
                .toggleStyle(.switch)

        }
        .padding()
        .onChange(of: age) { _, newAge in
            if newAge >= 18 {
                isOver18 = true
            } else {
                isOver18 = false
            }
        }
    }
}

#Preview {
    ToggleAndSliderPractice()
}
