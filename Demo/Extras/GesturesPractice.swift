//
//  GesturesPractice.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct GesturesPractice: View {
    var body: some View {
        Circle()
            .foregroundStyle(Color.cyan)
            .padding(50)
            .onTapGesture(count: 2) {
                print("On tapped twice")
            }
            .onLongPressGesture(minimumDuration: 2) {
                print("On long pressed")
            }
        Circle()
            .foregroundStyle(Color.blue)
            .padding(50)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        print("dragged value: \(value)")
                    })
            )
    }
}

#Preview {
    GesturesPractice()
}
