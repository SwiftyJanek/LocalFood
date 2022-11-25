//
//  Rezept.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import Foundation
import SwiftUI

struct Rezept: Hashable, Codable {
    var id: Int
    var name: String
    var kategorie: String
    var dauerMinuten: String
    var portionen: Int
    var zutatenListe: [String]
    var zutatenMenge: [String]
    var isVegan: Bool
    var isVegetarisch: Bool
    var schritte: [String]
    
    private var bildName: String
        var bild: Image {
            Image(bildName)
        }
}
