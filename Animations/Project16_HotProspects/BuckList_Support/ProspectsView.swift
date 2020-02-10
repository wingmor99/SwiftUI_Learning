//
//  ProspectsView.swift
//  Animations
//
//  Created by Jinchao Hou on 2/10/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted proplr"
        }
    }
    
    var body: some View {
        NavigationView {
            Text("Prople: \(prospects.people.count)")
            .navigationBarTitle(title)
                .navigationBarItems(trailing: Button(action: {
                    let prospect = Prospect()
                    prospect.name = "lin lin"
                    prospect.emailAddress = "lin@gmail.com"
                    self.prospects.people.append(prospect)
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                })
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
