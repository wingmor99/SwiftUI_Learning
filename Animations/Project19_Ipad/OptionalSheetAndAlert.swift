//
//  OptionalSheetAndAlert.swift
//  Animations
//
//  Created by Jinchao Hou on 2/14/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct User_19: Identifiable {
    var id = "Taylor Swift"
}

struct OptionalSheetAndAlert: View {
    @State private var selectedUser: User_19? = nil
    
    var body: some View {
        Text("Hello, world!")
            .onTapGesture {
                self.selectedUser = User_19()
            }
        .alert(item: $selectedUser) { user in
            Alert(title: Text(user.id))
        }
    }
}

struct OptionalSheetAndAlert_Previews: PreviewProvider {
    static var previews: some View {
        OptionalSheetAndAlert()
    }
}
