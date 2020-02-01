//
//  AddView.swift
//  Animations
//
//  Created by Jinchao Hou on 1/29/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/sharing-an-observed-object-with-a-new-view

import SwiftUI

struct AddView: View {
    // Add the sheet dismiss
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
//    @State var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    static var types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Your name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
        .navigationBarTitle("Add Expense")
            // save button
            .navigationBarItems(trailing:
                Button("save") {
                    if let actualAmount = Int(self.amount) {
                        let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                        self.expenses.items.append(item)
                        
                        // sheet dismiss
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            )
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
