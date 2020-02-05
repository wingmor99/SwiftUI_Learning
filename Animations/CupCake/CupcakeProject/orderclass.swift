//
//  orderclass.swift
//  Animations
//
//  Created by Jinchao Hou on 2/5/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        // set the extrafrosing and addSprinkles to false if setted to false
        didSet {
            if specialRequestEnabled == false {
                extrafrosing = false
                addSprinkles = false
            }
        }
    }
    @Published var extrafrosing = false
    @Published var addSprinkles = false
}
