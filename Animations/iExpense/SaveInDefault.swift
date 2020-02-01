//
//  IExpense.swift
//  Animations
//
//  Created by Jinchao Hou on 1/28/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//


// https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults

import SwiftUI

struct SaveInDefaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap Count")
    
    var body: some View {
        VStack {
            Button("Tap Count: \(tapCount)") {
                self.tapCount += 1
                UserDefaults.standard.set(self.tapCount, forKey: "Tap Count")
                
            }
            
            Button("Reset Count") {
                self.tapCount = 0
            }
        }
        
        
    }
}

struct SaveInDefaults_Previews: PreviewProvider {
    static var previews: some View {
        SaveInDefaults()
    }
}
