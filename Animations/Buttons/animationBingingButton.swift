//
//  animationBingingButton.swift
//  Animations
//
//  Created by Jinchao Hou on 1/27/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct animationBingingButton: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            // .animation can add other animation
            Stepper("Scale amount", value: $animationAmount.animation(
                // also can add animation of the button here
            ), in: 1...10)
            
            Slider(value: $animationAmount, in: 0...1)
            
            Spacer()
            
            
            Button("Tap me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .animation(Animation.easeInOut(duration: 3).repeatCount(3, autoreverses: true))
        }
    }
}

struct animationBingingButton_Previews: PreviewProvider {
    static var previews: some View {
        animationBingingButton()
    }
}
