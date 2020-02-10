//
//  BuckList.swift
//  Animations
//
//  Created by Jinchao Hou on 2/10/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct BuckList: View {
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Everyone")
                }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Contacted")
                }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Image(systemName: "questionmark.diamond")
                    Text("Uncontacted")
                }
//            MeView()
//                .tabItem {
//                    Image(systemName: "person.crop.square")
//                    Text("Me")
//                }
        }
    }
}

struct BuckList_Previews: PreviewProvider {
    static var previews: some View {
        BuckList()
    }
}
