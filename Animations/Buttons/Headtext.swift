//
//  Headtext.swift
//  Animations
//
//  Created by Jinchao Hou on 1/27/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct Headtext: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Headtext_Previews: PreviewProvider {
    static var previews: some View {
        Headtext(text: "Sample Text")
    }
}
