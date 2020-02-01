//
//  explicitAnimationButton.swift
//  Animations
//
//  Created by Jinchao Hou on 1/27/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct explicitAnimationButton: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap me") {
            // animation change, not immediatly
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1 , z: 0))
    }
}

struct explicitAnimationButton_Previews: PreviewProvider {
    static var previews: some View {
        explicitAnimationButton()
    }
}
