//
//  ContentView.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import SwiftUI
import CoreData

struct RezepteView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack{
            
            ScrollView {
                Text("RezepteView").font(.largeTitle)

                         LazyVGrid(columns: columns) {
                             ForEach(0x1f600...0x1f679, id: \.self) { value in
                                 Text(String(format: "%x", value))
                                 Text(emoji(value))
                                     .font(.largeTitle)
                             }
                         }
                     }
            
        }
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

struct RezepteView_Previews: PreviewProvider {
    static var previews: some View {
        RezepteView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
