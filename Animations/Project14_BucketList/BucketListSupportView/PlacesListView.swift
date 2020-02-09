//
//  PlacesListView.swift
//  Animations
//
//  Created by Jinchao Hou on 2/8/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import MapKit
import SwiftUI

struct PlacesListView: View {
    @Binding var locations: [CodableMKPointAnnotation]
    
    var body: some View {
        List{
            ForEach(locations, id: \.self) {location in
                Text(location.wrappedtitle)
            }
            .onDelete(perform: removelocation)
        }
    }
    
    func removelocation(at offsets: IndexSet) {
        locations.remove(atOffsets: offsets)
    }
}

//struct PlacesListView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        PlacesListView(locations: [CodableMKPointAnnotation.example, CodableMKPointAnnotation.example])
//    }
//}
