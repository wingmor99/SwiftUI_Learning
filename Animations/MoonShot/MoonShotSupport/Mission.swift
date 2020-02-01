//
//  Mission.swift
//  Animations
//
//  Created by Jinchao Hou on 2/1/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

// https://www.hackingwithswift.com/books/ios-swiftui/using-generics-to-load-any-kind-of-codable-data

// use generic to load 

import Foundation

struct CrewRole: Codable {
       let name: String
       let role: String
   }

struct Mission: Codable, Identifiable {

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
