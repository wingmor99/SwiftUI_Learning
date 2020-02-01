//
//  IExpense.swift
//  Animations
//
//  Created by Jinchao Hou on 1/28/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct SwipDelete: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                                Text("\($0)")
                    }
                                //swip delete
                        .onDelete(perform: removeRows)
                }
                Button("Add number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
//        .navigationBarItems(leading: EditButton())
        }
    }
    
    // swipe delete
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct SwipDelete_Previews: PreviewProvider {
    static var previews: some View {
        SwipDelete()
    }
}
