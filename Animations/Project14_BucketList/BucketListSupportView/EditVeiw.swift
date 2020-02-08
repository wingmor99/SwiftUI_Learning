//
//  EditVeiw.swift
//  Animations
//
//  Created by Jinchao Hou on 2/8/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import MapKit
import SwiftUI

struct EditVeiw: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Place name", text: $placemark.wrappedtitle)
                    TextField("Description", text: $placemark.wrappedSubtitle)
                }
            }
            .navigationBarTitle("Edit place")
            .navigationBarItems(trailing: Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct EditVeiw_Previews: PreviewProvider {
    static var previews: some View {
        EditVeiw(placemark: MKPointAnnotation.example)
    }
}
