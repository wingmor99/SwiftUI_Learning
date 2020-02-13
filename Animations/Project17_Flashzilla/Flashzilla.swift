//
//  Flashzilla.swift
//  Animations
//
//  Created by Jinchao Hou on 2/13/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/building-a-stack-of-cards

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct Flashzilla: View {
    @State private var cards = [Card](repeating: Card.example, count: 10)
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    
                    
                    ForEach(0..<cards.count, id: \.self) {index in
                        
                        SingleCaedView(card: self.cards[index])
                            .stacked(at: index, in: self.cards.count)
                    }
                }
            }
        }
    }
}

struct Flashzilla_Previews: PreviewProvider {
    static var previews: some View {
        Flashzilla()
    }
}
