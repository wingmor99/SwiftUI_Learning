 //
//  instafilterProject.swift
//  Animations
//
//  Created by Jinchao Hou on 2/6/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct instafilterProject: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                        .resizable()
                        .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    //
                }
                HStack {
                    Text("Intensity")
                    Slider(value: self.$filterIntensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change filter") {
                        //
                    }
                    Spacer()
                    Button("Save") {
                        
                    }
                }
                
            }
            .padding([.horizontal, .bottom])
        .navigationBarTitle("Instafilter")
        }
    }
}

struct instafilterProject_Previews: PreviewProvider {
    static var previews: some View {
        instafilterProject()
    }
}
    
