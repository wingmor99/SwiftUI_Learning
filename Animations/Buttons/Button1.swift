//
//  Button1.swift
//  Animations
//
//  Created by Jinchao Hou on 1/26/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct Button1: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap me") {
            // do nothing
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue: Color.red)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
    }
}

struct Button1_Previews: PreviewProvider {
    static var previews: some View {
        Button1()
    }
}
