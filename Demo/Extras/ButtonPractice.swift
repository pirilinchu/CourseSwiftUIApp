//
//  ButtonPractice.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct ButtonPractice: View {
    @State var value: Int = 0

    func onTap() {
        value += 1
    }

    func onTapDismiss() {
        value -= 1
    }

    var body: some View {
        VStack {
            Text("\(value)")
            NButton(title: "+1", isValid: true) {
                onTap()
            }
            NButton(title: "-1", isValid: true) {
                onTapDismiss()
            }
        }
        .padding()
    }
}

#Preview {
    ButtonPractice()
}
