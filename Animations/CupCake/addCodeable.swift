//
//  addCodeable.swift
//  Animations
//
//  Created by Jinchao Hou on 2/5/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/adding-codable-conformance-for-published-properties

import SwiftUI

class UserCupcake: ObservableObject, Codable {
    // make the name codable
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "lin Lin"
    
    // tell how to decode the name
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct addCodeable: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct addCodeable_Previews: PreviewProvider {
    static var previews: some View {
        addCodeable()
    }
}
