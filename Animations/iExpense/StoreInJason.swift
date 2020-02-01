//
//  iExpense.swift
//  Animations
//
//  Created by Jinchao Hou on 1/29/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//
// https://www.hackingwithswift.com/books/ios-swiftui/archiving-swift-objects-with-codable

import SwiftUI


struct User: Codable {
    var firstName: String
    var lastName: String
}

struct StoreInJason: View {
    @State private var user = User(firstName: "lin", lastName: "lin")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct StoreInJason_Previews: PreviewProvider {
    static var previews: some View {
        StoreInJason()
    }
}
