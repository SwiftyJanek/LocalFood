//
//  RezeptViewCustomImage.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import SwiftUI

// Hier wird das obere Foto im Rezeptview erzeugt und angepasst.
struct TitleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable(resizingMode: .stretch)
            .frame(width: 330, height: 220)
            .clipShape(Rectangle())
            .overlay { Rectangle().stroke(.white, lineWidth: 3) }
            .shadow(radius: 7)
        
    }
}

struct TitleImage_Previews: PreviewProvider {
    static var previews: some View {
        TitleImage(image: Image("kartoffelLauchSuppe"))
    }
}
