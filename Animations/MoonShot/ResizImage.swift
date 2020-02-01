//
//  ResizImage.swift
//  Animations
//
//  Created by Jinchao Hou on 2/1/20.
//  Copyright © 2020 Jinchao Hou. All rights reserved.
//

import SwiftUI

struct ResizImage: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("galaxy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
            Spacer()
            
        }
    }
}

struct ResizImage_Previews: PreviewProvider {
    static var previews: some View {
        ResizImage()
    }
}
