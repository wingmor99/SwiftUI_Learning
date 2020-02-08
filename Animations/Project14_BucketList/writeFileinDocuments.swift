//
//  writeFileinDocuments.swift
//  Animations
//
//  Created by Jinchao Hou on 2/7/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/writing-data-to-the-documents-directory

import SwiftUI

struct writeFileinDocuments: View {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    var body: some View {
        Text("Hello World")
        .onTapGesture {
            let str = "Test Message"
            let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")

            do {
                try str.write(to: url, atomically: true, encoding: .utf8)
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct writeFileinDocuments_Previews: PreviewProvider {
    static var previews: some View {
        writeFileinDocuments()
    }
}
