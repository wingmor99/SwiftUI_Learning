//
//  MoonShot.swift
//  Animations
//
//  Created by Jinchao Hou on 2/1/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct MoonShot: View {
    let astronauts: [AStronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) {mission in
                NavigationLink(destination: MissionDetail(mission: mission)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
        .navigationBarTitle(Text("MoonShot"))
        }
    }
}

struct MoonShot_Previews: PreviewProvider {
    static var previews: some View {
        MoonShot()
    }
}
