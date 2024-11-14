//
//  AnimationsPractice.swift
//  Demo
//
//  Created by Santiago Mendoza on 13/11/24.
//

import SwiftUI

struct AnimationsPractice: View {
    @State var showGreen: Bool = false

    var body: some View {
        VStack {
            Circle()
                .foregroundStyle(Color.cyan)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    withAnimation {
                        showGreen.toggle()
                    }
                }
            if showGreen {
                Circle()
                    .foregroundStyle(Color.green)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .slide, removal: .scale))
            }
        }
    }
}

#Preview {
    AnimationsPractice()
}
