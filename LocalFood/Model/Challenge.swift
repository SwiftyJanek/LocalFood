//
//  Challenge.swift
//  LocalFood
//
//  Created by Steffen Schulz on 16.01.23.
//

import Foundation
import SwiftUI

struct Challenge: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var kategorie: String
    var schwierigkeit: Int
    var progress: Float
    var belohnung: Int
    var badge: String
    var aufgabe: String
    var step1: Bool
    var step1Name: String
    var step1Header1: String
    var step1Header1Beschreibung: String
    var step1Header2: String
    var step1Header2Beschreibung: String
    var step2: Bool
    var step2Name: String
    var step2Header1: String
    var step2Header1Beschreibung: String
    var step2Header2: String
    var step2Header2Beschreibung: String
    var step3: Bool
    var step3Name: String
    var step3Header1: String
    var step3Header1Beschreibung: String
    var step3Header2: String
    var step3Header2Beschreibung: String
    var bild1: String
    var bild2: String
    var bild3: String
    var bild4: String
    var finished: Bool
    
    init(id: Int, name: String, kategorie: String, schwierigkeit: Int, progress: Float, belohnung: Int, badge: String, aufgabe: String, step1: Bool, step1Name: String, step1Header1: String, step1Header1Beschreibung: String, step1Header2: String, step1Header2Beschreibung: String, step2: Bool, step2Name: String, step2Header1: String, step2Header1Beschreibung: String, step2Header2: String, step2Header2Beschreibung: String, step3: Bool, step3Name: String, step3Header1: String, step3Header1Beschreibung: String, step3Header2: String, step3Header2Beschreibung: String, bild1: String, bild2: String, bild3: String, bild4: String, finished: Bool) {
        
        self.id = id
        self.name = name
        self.kategorie = kategorie
        self.schwierigkeit = schwierigkeit
        self.progress = progress
        self.belohnung = belohnung
        self.badge = badge
        self.aufgabe = aufgabe
        self.step1 = step1
        self.step1Name = step1Name
        self.step1Header1 = step1Header1
        self.step1Header1Beschreibung = step1Header1Beschreibung
        self.step1Header2 = step1Header2
        self.step1Header2Beschreibung = step1Header2Beschreibung
        self.step2 = step2
        self.step2Name = step2Name
        self.step2Header1 = step2Header1
        self.step2Header1Beschreibung = step2Header1Beschreibung
        self.step2Header2 = step2Header2
        self.step2Header2Beschreibung = step2Header2Beschreibung
        self.step3 = step3
        self.step3Name = step3Name
        self.step3Header1 = step3Header1
        self.step3Header1Beschreibung = step3Header1Beschreibung
        self.step3Header2 = step3Header2
        self.step3Header2Beschreibung = step3Header2Beschreibung
        self.bild1 = bild1
        self.bild2 = bild2
        self.bild3 = bild3
        self.bild4 = bild4
        self.finished = finished
    }
    
    
    
}
    

