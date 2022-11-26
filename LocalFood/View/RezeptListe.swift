//
//  RezeptListe.swift
//  LocalFood
//
//  Created by Janek Behrens on 26.11.22.
//

import SwiftUI

struct RezeptListe: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredRezepte: [Rezept] {
        modelData.rezepte.filter { rezept in
            (!showFavoritesOnly || rezept.isFavorit)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Nur Favoriten anzeigen")
                }

                ForEach(filteredRezepte) { rezept in
                    NavigationLink {
                        RezeptView(rezept: rezept)
                    } label: {
                        RezeptRow(rezept: rezept)
                    }
                }
            }
            .navigationTitle("Rezeptliste")
        }
    }
}

struct RezeptListe_Previews: PreviewProvider {
    static var previews: some View {
        RezeptListe()
            .environmentObject(ModelData())
    }
}
