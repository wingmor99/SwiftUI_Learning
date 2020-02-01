//
//  StringAnimating.swift
//  Animations
//
//  Created by Jinchao Hou on 1/27/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI


// https://www.hackingwithswift.com/books/ios-swiftui/animating-gestures

struct StringAnimating: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var drageAmount = CGSize.zero
    
    var body: some View {
        HStack {
            ForEach(0..<letters.count) {num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.drageAmount)
                    .animation(Animation.default.delay(Double(num) / 20 ))
            }
        }
        .gesture(
            DragGesture()
                .onChanged{ self.drageAmount = $0.translation }
                .onEnded { _ in
                    withAnimation {
                        self.drageAmount = .zero
                        self.enabled.toggle()
                    }
            }
        )
    }
}

struct StringAnimating_Previews: PreviewProvider {
    static var previews: some View {
        StringAnimating()
    }
}
