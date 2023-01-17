//
//  RezeptRow.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import SwiftUI

struct RezeptRow: View {
    var rezept: Rezept

    var body: some View {
        HStack{
            if let image = loadImage(from: rezept.bildURL) {
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                Text(rezept.name)
            } else {
                rezept.bild
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                Text(rezept.name)
            }
            Spacer()
        }
    }
}

func loadImage(from url: URL) -> Image? {
    if let imageData = try? Data(contentsOf: url),
        let uiImage = UIImage(data: imageData) {
        print("RezeptROW - UIImage geladen! \(url)")
        return Image(uiImage: uiImage)
    } else {
        print("RezeptROW - Fehler, konnte das User-Bild nicht laden...")
        return nil
    }
}

struct RezeptRow_Previews: PreviewProvider {
    static var rezepte = ModelData().rezepte
    
    static var previews: some View {
        Group{
            RezeptRow(rezept: rezepte[0])
            RezeptRow(rezept: rezepte[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
    
