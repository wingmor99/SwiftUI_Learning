//
//  pathVSshapes.swift
//  Animations
//
//  Created by Jinchao Hou on 2/2/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

//https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui

import SwiftUI

// Path is build for one thing.
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

//struct Arc: Shape {
struct Arc: InsettableShape {
    var starAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    //add strokeBorder()
    var insertAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = starAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insertAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insertAmount += amount
        return arc
    }
}

struct pathVSshapes: View {
    var body: some View {
        VStack(alignment: .leading) {
            Triangle()
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
            
            Arc(starAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
        }
        
    }
}

struct pathVSshapes_Previews: PreviewProvider {
    static var previews: some View {
        pathVSshapes()
    }
}
