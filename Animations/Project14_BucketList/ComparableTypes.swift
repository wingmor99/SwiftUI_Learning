//
//  ComparableTypes.swift
//  Animations
//
//  Created by Jinchao Hou on 2/7/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct User_14: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User_14, rhs: User_14) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ComparableTypes: View {
    let users = [
        User_14(firstName: "Arnold", lastName: "Rimmer"),
        User_14(firstName: "Kristine", lastName: "Kochanski"),
        User_14(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    var body: some View {
        List(users) {user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

struct ComparableTypes_Previews: PreviewProvider {
    static var previews: some View {
        ComparableTypes()
    }
}
