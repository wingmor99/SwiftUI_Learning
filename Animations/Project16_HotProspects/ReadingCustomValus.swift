//
//  ReadingCustomValus.swift
//  Animations
//
//  Created by Jinchao Hou on 2/9/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

class User_16: ObservableObject {
    @Published var name = "Lin Lin"
}

struct EditView_16: View {
    @EnvironmentObject var user: User_16
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView_16: View {
    @EnvironmentObject var user: User_16
    
    var body: some View {
        Text(user.name)
    }
}

struct ReadingCustomValus: View {
    let user = User_16()
    
    var body: some View {
        VStack {
            Text("One Edit View")
                .font(.headline)
            
            EditView_16()
            
            Text("Another display view")
                .font(.headline)
            
            DisplayView_16()
            
            List(0..<10) {
                Text("\($0)")
            }
            Text("Without @EnvironmentObject: \(user.name)")
        }.environmentObject(user)
    }
}

struct ReadingCustomValus_Previews: PreviewProvider {
    static var previews: some View {
        ReadingCustomValus()
    }
}
