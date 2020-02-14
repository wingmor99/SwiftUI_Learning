//
//  EditView_17.swift
//  Animations
//
//  Created by Jinchao Hou on 2/13/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct EditView_17: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add new card")) {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card") {
                        // add card
                        self.addCard()
                    }
                }
                
                Section {
                    ForEach(0..<cards.count , id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(self.cards[index].promt)
                                .font(.headline)
                            Text(self.cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    // delete the card
                    .onDelete(perform: removeCards)
                }
            
            .navigationViewStyle(StackNavigationViewStyle())}
        .navigationBarTitle("Edit cards")
            .navigationBarItems(trailing: Button("Done", action: dismiss))
        .listStyle(GroupedListStyle())
            .onAppear(perform: loadData)
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newPrompt.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else {return}
        
        let card = Card(promt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct EditView_17_Previews: PreviewProvider {
    static var previews: some View {
        EditView_17()
    }
}
