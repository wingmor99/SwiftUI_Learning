//
//  ContentView.swift
//  Animations
//
//  Created by Jinchao Hou on 1/26/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Headtext(text: "Shape with color animation")
                .font(.headline)
            Button1()
            
            
            Headtext(text: "Animation with value increase")
            explicitAnimationButton()
            
            Headtext(text: "Animation with stepper")
            animationBingingButton()
            
            Headtext(text: "On appear animation")
            easeButton()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
