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
        NavigationView {
            List {
                VStack(alignment: .leading) {
                    Headtext(text: "Shape with color animation")
                    Divider()
                    Button1()
                    
                    Divider()
                    
                    Headtext(text: "Animation with value increase")
                    Divider()
                    explicitAnimationButton()
                }
                VStack(alignment: .leading) {
                    Headtext(text: "Animation with stepper")
                    Divider()
                    animationBingingButton()
                    
                    Headtext(text: "On appear animation")
                    Divider()
                    easeButton()
                }
                
                Text("Advance animating usages")
                    .font(.headline)
                    .foregroundColor(.yellow)
                
                Group {
                    NavigationLink(destination: animatingGestures()) {
                        Text("Animating Gestures")
                    }
                    
                    NavigationLink(destination: StringAnimating()) {
                        Text("String Animating")
                    }
                    
                    NavigationLink(destination:transitionAnimation()) {
                        Text("transitionAnimation")
                    }
                    
                    NavigationLink(destination: customTransitions()) {
                        Text("Custom Transitions")
                    }
                    
                    NavigationLink(destination: SwipDelete()) {
                        Text("Swip Delete")
                    }
                    
                    NavigationLink(destination: SaveInDefaults()) {
                        Text("Save In Defaults")
                    }
                    
                    NavigationLink(destination: IExpense()) {
                        Text("iExpense project")
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
