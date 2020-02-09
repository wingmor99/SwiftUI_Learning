//
//  PublishingObservableObjectChanges.swift
//  Animations
//
//  Created by Jinchao Hou on 2/9/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/manually-publishing-observableobject-changes

import SwiftUI

class DelayedUpdater: ObservableObject {
    // @Published var value = 0
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            // Run the code after....
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct PublishingObservableObjectChanges: View {
    @ObservedObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is : \(updater.value)")
    }
}

struct PublishingObservableObjectChanges_Previews: PreviewProvider {
    static var previews: some View {
        PublishingObservableObjectChanges()
    }
}
