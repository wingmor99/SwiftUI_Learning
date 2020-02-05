//
//  rakingOrderDetails.swift
//  Animations
//
//  Created by Jinchao Hou on 2/5/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/checking-for-a-valid-address

import SwiftUI

struct rakingOrderDetails: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special request?")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extrafrosing) {
                            Text("Add extra forsting")
                        }
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AdressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
        navigationBarTitle("Cupcake Corner")
        }
    }
}

struct rakingOrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        rakingOrderDetails()
    }
}
