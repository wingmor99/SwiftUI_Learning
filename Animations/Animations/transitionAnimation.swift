//
//  transitionAnimation.swift
//  Animations
//
//  Created by Jinchao Hou on 1/28/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct transitionAnimation: View {
    @State private var showingRectangle = false
    
    var body: some View {
        VStack {
            Button("Show") {
                withAnimation {
                    self.showingRectangle.toggle()
                }
            }
            
            if showingRectangle {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct transitionAnimation_Previews: PreviewProvider {
    static var previews: some View {
        transitionAnimation()
    }
}
