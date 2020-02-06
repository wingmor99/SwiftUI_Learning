//
//  multipleoptions.swift
//  Animations
//
//  Created by Jinchao Hou on 2/6/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/showing-multiple-options-with-actionsheet

import SwiftUI

struct multipleoptions: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
        .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                .default(Text("Red")) { self.backgroundColor = .red},
                .default(Text("Green")) { self.backgroundColor = .green},
                .default(Text("Blue")) {self.backgroundColor = .blue}
            ])
        }
    }
}

struct multipleoptions_Previews: PreviewProvider {
    static var previews: some View {
        multipleoptions()
    }
}
