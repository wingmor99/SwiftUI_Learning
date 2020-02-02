//
//  MissionDetail.swift
//  Animations
//
//  Created by Jinchao Hou on 2/1/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct MissionDetail: View {
    let mission: Mission
    
    var body: some View {
        GeometryReader {geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.mission.description)
                        .padding()
                    
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
}

struct MissionDetail_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionDetail(mission: missions[0])
    }
}
