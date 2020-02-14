//
//  Flashzilla.swift
//  Animations
//
//  Created by Jinchao Hou on 2/13/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/building-a-stack-of-cards

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct Flashzilla: View {
    @State private var cards = [Card]()
    
    // Adding timer
    @State private var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isActive = true
    
    // add card
    @State private var showingEditScreen = false
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.showingEditScreen = true
                        }) {
                            Image(systemName: "plus.circle")
                                .padding()
                                .background(Color.black.opacity(0.75))
                                .clipShape(Circle())
                        }
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding()
                
                Text("Time: \(timeRemaining)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(Color.black)
                        .opacity(0.75)
                )
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) {index in
                        
                        SingleCaedView(card: self.cards[index]) {
                            withAnimation {
                                self.removeCard(at: index)
                            }
                        }
                            .stacked(at: index, in: self.cards.count)
                        // stop drag card below
                            .allowsHitTesting(index == self.cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditView_17()
        }
        // reset before show
        .onAppear(perform: resetCards)
        .onReceive(timer) { time in
            guard self.isActive else {return}
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            if self.cards.isEmpty == false {
                self.isActive = true
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
        // stop timer when remove last card
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        timeRemaining = 10
        isActive = true
        loadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
            }
        }
    }
}

struct Flashzilla_Previews: PreviewProvider {
    static var previews: some View {
        Flashzilla()
    }
}
