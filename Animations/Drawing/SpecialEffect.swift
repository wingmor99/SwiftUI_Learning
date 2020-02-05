//
//  SpecialEffect.swift
//  Animations
//
//  Created by Jinchao Hou on 2/5/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/special-effects-in-swiftui-blurs-blending-and-more

import SwiftUI

struct SpecialEffect: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack {
            ZStack {
                //            Spacer()
                //
                //            Image("peopleface")
                //                .colorMultiply(.red)
                
                
//                        Circle()
////                            not full red
////                            .fill(Color.red)
//                            .fill(Color(red: 1, green: 0, blue: 0))
//                            .frame(width: 200 * amount)
//                            .offset(x: -50, y: -80)
//                            .blendMode(.screen)
//
//                        Circle()
//                            .fill(Color(red: 0, green: 1, blue: 0))
//                            .frame(width: 200 * amount)
//                            .offset(x: 50, y: -80)
//                            .blendMode(.screen)
//
//                        Circle()
//                            .fill(Color(red: 0, green: 0, blue: 1))
//                            .frame(width: 200 * amount)
//                            .blendMode(.screen)
                        
                
                Image("peopleface")
                    .resizable()
                .scaledToFit()
                    .frame(width: 400, height: 400)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            }
                    .frame(width:300, height: 300)
                    
                    Slider(value: $amount)
                    .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct SpecialEffect_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffect()
    }
}
