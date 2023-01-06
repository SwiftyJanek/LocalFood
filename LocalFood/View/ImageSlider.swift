//
//  ImageSlider.swift
//  LocalFood
//
//  Created by Steffen Schulz on 07.11.22.
//

import SwiftUI

struct ImageSlider: View {

    // Array mit den Bildern
    var images = [String]()
    
    
    init(images: [String]) {
        self.images = images
    }
    
    var body: some View {
        // TabView + tabViewStyle(PageTabViewStyle)
        TabView {
            ForEach(images, id: \.self) { item in
                //3
                Image(item).resizable().scaledToFill()
        
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(images: [String]()).previewLayout(.fixed(width: 400, height: 300))
    }
}
