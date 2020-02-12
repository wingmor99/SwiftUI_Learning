//
//  WorkWithTimer.swift
//  Animations
//
//  Created by Jinchao Hou on 2/12/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/triggering-events-repeatedly-using-a-timer

import SwiftUI

struct WorkWithTimer: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) {time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                self.counter += 1
        }
    }
}

struct WorkWithTimer_Previews: PreviewProvider {
    static var previews: some View {
        WorkWithTimer()
    }
}
