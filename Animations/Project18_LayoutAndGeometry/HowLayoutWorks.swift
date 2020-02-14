//
//  HowLayoutWorks.swift
//  Animations
//
//  Created by Jinchao Hou on 2/14/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/how-layout-works-in-swiftui

import SwiftUI

struct HowLayoutWorks: View {
    var body: some View {
        Text("Hello World!")
//            .position(x: 100, y: 100)
            .offset(x: 100, y: 100)
            .background(Color.red)
    }
}

struct HowLayoutWorks_Previews: PreviewProvider {
    static var previews: some View {
        HowLayoutWorks()
    }
}
