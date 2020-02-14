//
//  HowGeometryReaderWorks.swift
//  Animations
//
//  Created by Jinchao Hou on 2/14/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct HowGeometryReaderWorks: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(width: fullView.size.width)
                            .background(self.colors[index % 7])
                            .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY) / 5), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct HowGeometryReaderWorks_Previews: PreviewProvider {
    static var previews: some View {
        HowGeometryReaderWorks()
    }
}
