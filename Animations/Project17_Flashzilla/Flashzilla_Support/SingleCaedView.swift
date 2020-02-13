//
//  SingleCaedView.swift
//  Animations
//
//  Created by Jinchao Hou on 2/13/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct Card {
    let promt: String
    let answer: String
    
    static var example: Card {
        return Card(promt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}

struct SingleCaedView: View {
    let card: Card
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    // remove the card
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25), style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            VStack {
                Text(card.promt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                if isShowingAnswer {
                    Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.offset = value.translation
                }
                
                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        // remove the card
                        self.removal?()
                    } else {
                        self.offset = .zero
                    }
                }
        )
    }
}

struct SingleCaedView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCaedView(card: Card.example)
    }
}
