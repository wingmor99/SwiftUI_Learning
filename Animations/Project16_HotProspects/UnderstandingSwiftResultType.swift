//
//  UnderstandingSwiftResultType.swift
//  Animations
//
//  Created by Jinchao Hou on 2/9/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

//https://www.hackingwithswift.com/books/ios-swiftui/understanding-swifts-result-type

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFaied, unknown
}

struct UnderstandingSwiftResultType: View {
    var body: some View {
        Text("Unclear till now , need learning")
    }
}

struct UnderstandingSwiftResultType_Previews: PreviewProvider {
    static var previews: some View {
        UnderstandingSwiftResultType()
    }
}
