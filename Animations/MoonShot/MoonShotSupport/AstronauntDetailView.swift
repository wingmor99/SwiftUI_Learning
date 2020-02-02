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
    let wasInMission: [Mission]
    
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
                    
                    ForEach(self.wasInMission) {
                        Image($0.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * 0.7)
                            .padding(.top)
                    }
                    .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: AStronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
//        matches = missions.filter{$0.crew == $0.crew.filter{$0.name == astronaut.id}}
        
        for mission in missions {
            if let _ = mission.crew.first(where: {$0.name == astronaut.id}) {
                matches.append(mission)
            }
            
            // Error after add the else
//            else {
//                fatalError("Missing \(mission)")
//            }
        }
        self.wasInMission = matches
    }
}

struct AstronauntDetailView_Previews: PreviewProvider {
    static let astronaut: [AStronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronauntDetailView(astronaut: astronaut[0], missions: missions)
    }
}
