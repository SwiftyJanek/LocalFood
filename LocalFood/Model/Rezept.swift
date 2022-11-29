//
//  Rezept.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import Foundation
import SwiftUI

struct Rezept: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var kategorie: String
    var dauerMinuten: String
    var portionen: Int
    var isVegan: Bool
    var isVegetarisch: Bool
    var isFavorisiert: Bool
    var isFavorit: Bool
    var zutatenListe: [String]
    var zutatenMenge: [String]
    var schritte: [String]
    
    private var bildName: String
        var bild: Image {
            Image(bildName)
        }
}
