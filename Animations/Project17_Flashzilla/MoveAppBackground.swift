//
//  MoveAppBackground.swift
//  Animations
//
//  Created by Jinchao Hou on 2/12/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/how-to-be-notified-when-your-swiftui-app-moves-to-the-background


import SwiftUI

struct MoveAppBackground: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) {_ in
                // run when app is moved to background
                print("Moving to the background!")
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) {_ in
                print("Back to the foreground")
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) {_ in
                print("User took a screenshot!")
            }
    }
}

struct MoveAppBackground_Previews: PreviewProvider {
    static var previews: some View {
        MoveAppBackground()
    }
}
