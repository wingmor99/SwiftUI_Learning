 //
//  instafilterProject.swift
//  Animations
//
//  Created by Jinchao Hou on 2/6/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//
 
 // https://www.hackingwithswift.com/books/ios-swiftui/basic-image-filtering-using-core-image

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
 
struct instafilterProject: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingFilterShhet = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        // binding the filterintensity
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView{
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
                    self.showingImagePicker = true
                }
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change filter") {
                        self.showingFilterShhet = true
                    }
                    Spacer()
                    Button("Save") {
                        guard let processedImage = self.processedImage else {return}
                        
                        let imageSaver = ImageSaver_Project()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                        }
                        
                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
                
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker_project(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingFilterShhet) {
                ActionSheet(title: Text("Select a filter"), buttons: [
                    .default(Text("Crystallize")) {
                        self.setFilter(CIFilter.crystallize())
                    },
                    .default(Text("Edges")) { self.setFilter(CIFilter.edges())},
                    .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur())},
                    .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate())},
                    .default(Text("Sepia Tone")) {self.setFilter(CIFilter.sepiaTone())},
                    .default(Text("Unsharp Mask")) {self.setFilter(CIFilter.unsharpMask())},
                    .default(Text("Vignette")) {self.setFilter(CIFilter.vignette())},
                    .default(Text("Bloom")) {self.setFilter(CIFilter.bloom())},
                    .cancel()
                ])
            }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else {return}
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    // change the filter
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct instafilterProject_Previews: PreviewProvider {
    static var previews: some View {
        instafilterProject()
    }
}
    
