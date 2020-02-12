//
//  DiableUserInteractivity.swift
//  Animations
//
//  Created by Jinchao Hou on 2/12/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct DiableUserInteractivity: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
            .frame(width: 300, height: 300)
                // tapable area
            .contentShape(Rectangle())
            .onTapGesture {
                    print("Rectangle tapped!")
            }
            
            Circle()
                .fill(Color.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
            .allowsHitTesting(false)
        }
    }
}

struct DiableUserInteractivity_Previews: PreviewProvider {
    static var previews: some View {
        DiableUserInteractivity()
    }
}
