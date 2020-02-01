//
//  ScrollingView.swift
//  Animations
//
//  Created by Jinchao Hou on 2/1/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View{
        Text(text)
    }
    
    init(_ text: String) {
        // SwiftUI Create all row inmediately
        // List is lazy.
        print("Creating a customText")
        self.text = text
    }
}


struct ScrollingView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item\($0)")
                        .font(.headline)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingView()
    }
}
