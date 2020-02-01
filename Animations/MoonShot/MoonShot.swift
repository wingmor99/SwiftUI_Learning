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
    
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct MoonShot_Previews: PreviewProvider {
    static var previews: some View {
        MoonShot()
    }
}
