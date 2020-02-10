//
//  CreateContextMenu.swift
//  Animations
//
//  Created by Jinchao Hou on 2/9/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/creating-context-menus

import SwiftUI

struct CreateContextMenu: View {
    @State private var backgroundColor = Color.red

        var body: some View {
            VStack {
                Text("Hello, World!")
                    .padding()
                    .background(backgroundColor)

                Text("Change Color")
                    .padding()
                    .contextMenu {
                        Button(action: {
                            self.backgroundColor = .red
                        }) {
                            Text("Red")
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(Color.red)
                        }

                        Button(action: {
                            self.backgroundColor = .green
                        }) {
                            Text("Green")
                        }

                        Button(action: {
                            self.backgroundColor = .blue
                        }) {
                            Text("Blue")
                        }
                    }
            }
        }
}

struct CreateContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        CreateContextMenu()
    }
}
