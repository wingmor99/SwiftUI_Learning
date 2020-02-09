//
//  GroupAccessibility.swift
//  Animations
//
//  Created by Jinchao Hou on 2/9/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//
// https://www.hackingwithswift.com/books/ios-swiftui/hiding-and-grouping-accessibility-data

import SwiftUI

struct GroupAccessibility: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibility(label: Text("Your score is 1000"))
    }
}

struct GroupAccessibility_Previews: PreviewProvider {
    static var previews: some View {
        GroupAccessibility()
    }
}
