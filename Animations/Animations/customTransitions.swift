//
//  customTransitions.swift
//  Animations
//
//  Created by Jinchao Hou on 1/28/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct CornerRotateModifiers: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
        .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifiers(amount: -90, anchor: .topLeading), identity: CornerRotateModifiers(amount: 0, anchor: .topLeading))
    }
}
  

struct customTransitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
    }
}

struct customTransitions_Previews: PreviewProvider {
    static var previews: some View {
        customTransitions()
    }
}
