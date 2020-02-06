//
//  CoreImage.swift
//  Animations
//
//  Created by Jinchao Hou on 2/6/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//
// https://www.hackingwithswift.com/books/ios-swiftui/integrating-core-image-with-swiftui

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct UsingCoreImage: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
            .resizable()
            .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        // UIImage
        guard let inputImage = UIImage(named: "peopleface") else {return}
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
//        let currentFilter = CIFilter.sepiaTone()
        let currentFilter = CIFilter.pixellate()
        
        
        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
        currentFilter.scale = 10
        
        
        guard let outImage = currentFilter.outputImage else {return}
        
        if let cgimg = context.createCGImage(outImage, from: outImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct CoreImage_Previews: PreviewProvider {
    static var previews: some View {
        UsingCoreImage()
    }
}

