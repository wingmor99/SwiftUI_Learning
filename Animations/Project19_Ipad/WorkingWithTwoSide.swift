//
//  WorkingWithTwoSide.swift
//  Animations
//
//  Created by Jinchao Hou on 2/14/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct WorkingWithTwoSide: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New secondary View")) {
                Text("Hello, world!")
            }
                
                .navigationBarTitle("Promary")
            
            Text("Secondary")
        }
    }
}

struct WorkingWithTwoSide_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithTwoSide()
    }
}
