//
//  BucketList.swift
//  Animations
//
//  Created by Jinchao Hou on 2/8/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import MapKit
import SwiftUI

struct BucketList: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var showingEdit = false
    
    var body: some View {
        ZStack {
            ProjectMapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.title = "Example Location"
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                        
                        self.selectedPlace = newLocation
                        self.showingEdit = true
                    }) {
                        Image(systemName: "plus")
                    }  
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                self.showingEdit = true
            })
        }
        .sheet(isPresented: $showingEdit) {
            if self.selectedPlace != nil {
                EditVeiw(placemark: self.selectedPlace!)
            }
        }
    }
}

struct BucketList_Previews: PreviewProvider {
    static var previews: some View {
        BucketList()
    }
}
