//
//  Rezept.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import Foundation
import SwiftUI

// Klasse Rezept
struct Rezept: Hashable, Codable, Identifiable {
    var id: UUID
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
    var kommentar: [String]
    var kommentarBenutzer: [String]
    var benutzerBild: [String]
    var bildURL: URL
    var bildName: String
    var bild: Image {
        Image(bildName)
    }
    
    // Konstruktor für Rezepte
    init(name: String, kategorie: String, dauerMinuten: String, portionen: Int, isVegan: Bool, isVegetarisch: Bool, isFavorisiert: Bool, isFavorit: Bool, zutatenListe: [String], zutatenMenge: [String], schritte: [String], bildName: String, bildURL: URL, kommentar: [String], kommentarBenutzer: [String], benutzerBild: [String]) {
        self.id = UUID()
        self.name = name
        self.kategorie = kategorie
        self.dauerMinuten = dauerMinuten
        self.portionen = portionen
        self.isVegan = isVegan
        self.isVegetarisch = isVegetarisch
        self.isFavorisiert = isFavorisiert
        self.isFavorit = isFavorit
        self.zutatenListe = zutatenListe
        self.zutatenMenge = zutatenMenge
        self.schritte = schritte
        self.bildURL = bildURL
        self.bildName = bildName
        self.kommentar = kommentar
        self.kommentarBenutzer = kommentarBenutzer
        self.benutzerBild = benutzerBild
    }
}


