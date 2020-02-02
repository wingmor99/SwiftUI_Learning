//
//  AstronauntDetailView.swift
//  Animations
//
//  Created by Jinchao Hou on 2/1/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct AstronauntDetailView: View {
    let astronaut: AStronaut
    
    var body: some View {
        GeometryReader {geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                    .layoutPriority(1)
                    
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronauntDetailView_Previews: PreviewProvider {
    static let astronaut: [AStronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronauntDetailView(astronaut: astronaut[0])
    }
}
