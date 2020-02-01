//
//  easeButton.swift
//  Animations
//
//  Created by Jinchao Hou on 1/27/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct easeButton: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            // tap to cause
            // self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
            .scaleEffect(animationAmount)
            .opacity(Double(2-animationAmount))
            .animation(
                    Animation.easeInOut(duration: 1)
                .repeatForever(autoreverses: false)
            )
        )
            // once appear
            .onAppear() {
                self.animationAmount = 2
        }
    }
}

struct easeButton_Previews: PreviewProvider {
    static var previews: some View {
        easeButton()
    }
}
