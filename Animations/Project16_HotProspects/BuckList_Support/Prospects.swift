//
//  Prospects.swift
//  Animations
//
//  Created by Jinchao Hou on 2/10/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/saving-and-loading-data-with-userdefaults

import Foundation

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    
    //
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    static let saveKey = "SaveData_15"
    // stop external writes to the people array
    @Published private(set) var people: [Prospect]
    
    init() {
        // 1. Reading Data from UserDefaults
        if let data = UserDefaults.standard.data(forKey: Prospects.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        
        self.people = []
    }
    
    // change uncontacted to contacted
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        // 2.2
        save()
    }
    
    // 2.1 Save data into UserDefault
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Prospects.saveKey)
        }
    }
    
    // Add method
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
}
