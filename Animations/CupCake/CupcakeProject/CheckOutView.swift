//
//  CheckOutView.swift
//  Animations
//
//  Created by Jinchao Hou on 2/5/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showconfirmation = false
    
    var body: some View {
        GeometryReader {geo in
            ScrollView {
                VStack {
                    Image("peopleface")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place order") {
                        self.placeOrdre()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check our", displayMode: .inline)
        .alert(isPresented: $showconfirmation) {
            Alert(title: Text("Thank you"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    // a method to place order
    // https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-orders-over-the-internet
    func placeOrdre() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data else {
                print("no data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
                self.showconfirmation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
