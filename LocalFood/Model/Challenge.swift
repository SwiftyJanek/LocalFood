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
    var badge: String
    
    
    init(id: Int, name: String, kategorie: String, schwierigkeit: Int,progress: Float, badge: String) {
        self.id = id
        self.name = name
        self.kategorie = kategorie
        self.schwierigkeit = schwierigkeit
        self.progress = progress
        self.badge = badge
    }
    
    
}
    

