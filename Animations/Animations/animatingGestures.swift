//
//  animatingGestures.swift
//  Animations
//
//  Created by Jinchao Hou on 1/27/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct animatingGestures: View {
    // variable to store gesture amount
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation}
                    .onEnded {_ in
                        // only animated when releasing the drag
                        withAnimation(.spring()) {
                                self.dragAmount = .zero
                        }
                    }
            )
    }
}

struct animatingGestures_Previews: PreviewProvider {
    static var previews: some View {
        animatingGestures()
    }
}
