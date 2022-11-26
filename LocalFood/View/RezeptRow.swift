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
            rezept.bild
                .resizable()
                .frame(width: 50, height: 50)
            Text(rezept.name)
            
            Spacer()
        }
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
    
