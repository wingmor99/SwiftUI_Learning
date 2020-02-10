//
//  TabAndTabItems.swift
//  Animations
//
//  Created by Jinchao Hou on 2/9/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/creating-tabs-with-tabview-and-tabitem

import SwiftUI

struct TabAndTabItems: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab){
            Text("TabView1")
                .onTapGesture {
                    self.selectedTab = 1
                    print("\(self.selectedTab)")
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("TabItem1")
                }
            Text("TabView2")
                .onTapGesture {
                    self.selectedTab = 2
                }
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("TabItem2")
                }
                .tag(1)
        }
    }
}

struct TabAndTabItems_Previews: PreviewProvider {
    static var previews: some View {
        TabAndTabItems()
    }
}
