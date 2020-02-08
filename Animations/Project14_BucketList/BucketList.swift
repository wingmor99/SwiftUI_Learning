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
    @State private var location = [MKPointAnnotation]()
    
    var body: some View {
        ZStack {
            ProjectMapView(centerCoordinate: $centerCoordinate, annotations: location)
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
                        newLocation.coordinate = self.centerCoordinate
                        self.location.append(newLocation)
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
    }
}

struct BucketList_Previews: PreviewProvider {
    static var previews: some View {
        BucketList()
    }
}
