//
//  RezeptViewCustomImage.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import SwiftUI

struct TitleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable(resizingMode: .stretch)
            .frame(width: 300, height: 200)
            .clipShape(Rectangle())
            .overlay { Rectangle().stroke(.white, lineWidth: 4) }
            .shadow(radius: 7)
            
    }
}

struct TitleImage_Previews: PreviewProvider {
    static var previews: some View {
        TitleImage(image: Image("kartoffelLauchSuppe"))
    }
}
