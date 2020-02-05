//
//  ContentView.swift
//  Animations
//
//  Created by Jinchao Hou on 1/26/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showfollow1 = false
    @State private var showfollow2 = false
    @State private var showiexpense = false
    @State private var showmoonshot = false
    @State private var showDraw = false
    @State private var showCupcake = true
    
    var body: some View {
        NavigationView {
            List {
                Section(header:
                    HStack {
                        Text("Basic Animation")
                        Spacer()
                        Image(systemName: "plus")
                    }.onTapGesture {
                        self.showfollow1.toggle()
                        
                    }
                ){
                    if self.showfollow1 {
                        Headtext(text: "Shape with color animation")
                        Button1()

                        Headtext(text: "Animation with value increase")
                        explicitAnimationButton()
                        
                        Headtext(text: "Animation with stepper")
                        animationBingingButton()
                        
                        Headtext(text: "On appear animation")
                        easeButton()
                    }
                }
                Section(header:
                    HStack{
                        Text("Advance animating usages")
                        Spacer()
                        Image(systemName: "plus")
                    }.onTapGesture {
                        self.showfollow2.toggle()
                    }
                ){
                        if showfollow2 {
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
                        }
                }
                Section(header:
                    HStack {
                        Text("iExpense Project")
                        Spacer()
                        Image(systemName: "plus")
                    }.onTapGesture {
                            self.showiexpense.toggle()
                    }
                ){
                    if showiexpense {
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
                Section(header:
                    HStack{
                        Text("MoonShot Project")
                        Spacer()
                        Image(systemName: "plus")
                    }.onTapGesture {
                            self.showmoonshot.toggle()
                    }
                ) {
                    if self.showmoonshot {
                        NavigationLink(destination: ResizImage()) {
                            Text("GeometryReader Image")
                        }
                        
                        NavigationLink(destination: ScrollingView()) {
                            Text("Scroll view is not lazy")
                        }
                        
                        NavigationLink(destination: HierarchicalCodable()) {
                            Text("JSON Decode")
                        }
                        NavigationLink(destination: MoonShot()) {
                            Text("MoonShot Project")
                        }
                    }
                }
                Section(header:
                    HStack{
                        Text("Drawing")
                        Spacer()
                        Image(systemName: "plus")
                    }.onTapGesture {
                        self.showDraw.toggle()
                }) {
                    if self.showDraw {
                        NavigationLink(destination: customPaths()) {
                            Text("custom Draw with Paths")
                        }
                        NavigationLink(destination: pathVSshapes()) {
                            Text("customize path stuct for future")
                        }
                        NavigationLink(destination: pathStrokeBorder()) {
                            Text("add strokeBorder in custom path")
                        }
                        NavigationLink(destination: TransformingShapes()) {
                            Text("CGAffineTransform and even-odd fills")
                        }
                        NavigationLink(destination: PerformanceRendering()) {
                            Text("Add the drawingGroup when the path run slow")
                        }
                        NavigationLink(destination: SpecialEffect()) {
                            Text("ColorMultiply and saturation")
                        }
                        NavigationLink(destination: AnimatiingShapes()) {
                            Text("AnimatableData to add animation for custom shapes")
                        }
                        NavigationLink(destination: complexanimating()) {
                            Text("Using animatablePair to animate complex pair")
                        }
                        NavigationLink(destination: DrawSpirograph()) {
                            Text("Complex graph create by path")
                        }
                    }
                }
                Section(header:
                    HStack{
                        Text("Cupcake")
                        Spacer()
                        Image(systemName: "plus")
                    }.onTapGesture {
                        self.showCupcake.toggle()
                }
                ){
                    if self.showCupcake {
                        NavigationLink(destination: receivingURL()) {
                            Text("Request and receive data from URL")
                        }
                        NavigationLink(destination: disableForm()) {
                            Text("disable form by condition")
                        }
                        NavigationLink(destination: rakingOrderDetails()) {
                            Text("Cupcake order project")
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Hacking with SwiftUI"),displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
