//
//  customPaths.swift
//  Animations
//
//  Created by Jinchao Hou on 2/2/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct customPaths: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
        }
//        .stroke(Color.blue.opacity(0.25), lineWidth: 10)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct customPaths_Previews: PreviewProvider {
    static var previews: some View {
        customPaths()
    }
}
