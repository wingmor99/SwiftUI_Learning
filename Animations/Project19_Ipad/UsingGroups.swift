//
//  UsingGroups.swift
//  Animations
//
//  Created by Jinchao Hou on 2/14/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct User_19View: View {
    var body: some View {
        Group {
            Text("Name: lin")
            Text("Country: Endland")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

struct UsingGroups: View {
    @State var layoutVertically = false
    
    var body: some View {
        Group {
            if layoutVertically {
                VStack {
                    User_19View()
                }
            } else {
                HStack {
                    User_19View()
                }
            }
        }
        .onTapGesture {
            self.layoutVertically.toggle()
        }
    }
}

struct UsingGroups_Previews: PreviewProvider {
    static var previews: some View {
        UsingGroups()
    }
}
