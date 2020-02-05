//
//  AnimatiingShapes.swift
//  Animations
//
//  Created by Jinchao Hou on 2/5/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/animating-simple-shapes-with-animatabledata

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    // add the animation changing
    var animatableData: CGFloat {
        get {insetAmount }
        set { self.insetAmount = newValue}
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))

        return path
   }
}

struct AnimatiingShapes: View {
    @State private var insetAmount: CGFloat = 50
//    @State private var framewidth: CGFloat = 200
//    @State private var frameheight: CGFloat = 200
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation{
                    self.insetAmount = CGFloat.random(in: 10...90)
//                    self.framewidth = CGFloat.random(in: 100...200)
//                    self.frameheight = CGFloat.random(in: 100...200)
                }
        }
    }
}

struct AnimatiingShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatiingShapes()
    }
}
