//
//  Prospects.swift
//  Animations
//
//  Created by Jinchao Hou on 2/10/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import Foundation

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    
    //
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    
    init() {
        self.people = []
    }
    
    // change uncontacted to contacted
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}
