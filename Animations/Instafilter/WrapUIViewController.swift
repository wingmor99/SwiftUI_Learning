//
//  WrapUIViewController.swift
//  Animations
//
//  Created by Jinchao Hou on 2/6/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct WrapUIViewController: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                self.showingImagePicker = true
            }
            
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker()
            }
        }
    }
}

struct WrapUIViewController_Previews: PreviewProvider {
    static var previews: some View {
        WrapUIViewController()
    }
}
