//
//  pathStrokeBorder.swift
//  Animations
//
//  Created by Jinchao Hou on 2/3/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct pathStrokeBorder: View {
    var body: some View {
        Arc(starAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 40)
        
    }
}

struct pathStrokeBorder_Previews: PreviewProvider {
    static var previews: some View {
        pathStrokeBorder()
    }
}
