//
//  IExpense.swift
//  Animations
//
//  Created by Jinchao Hou on 1/29/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//
// https://www.hackingwithswift.com/books/ios-swiftui/building-a-list-we-can-delete-from

import SwiftUI

// 1. what we want to store
struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

// 2. a class to store all expense items
//struct Expenses {
class Expenses: ObservableObject {
//    var items = [ExpenseItem]()
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}

struct IExpense: View {
//    @State var expenses = Expenses()
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) {item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                    }
                }
            .onDelete(perform: removeRows)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
            Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: self.expenses)
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct IExpense_Previews: PreviewProvider {
    static var previews: some View {
        IExpense()
    }
}
