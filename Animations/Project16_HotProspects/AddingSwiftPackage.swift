//
//  AddingSwiftPackage.swift
//  Animations
//
//  Created by Jinchao Hou on 2/9/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI
import SamplePackage

struct AddingSwiftPackage: View {
    let possibleNumbers = Array(1...60)
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

struct AddingSwiftPackage_Previews: PreviewProvider {
    static var previews: some View {
        AddingSwiftPackage()
    }
}
