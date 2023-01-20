//
//  Startpage.swift
//  LocalFood
//
//  Created by Janek Behrens on 20.01.23.
//

import Foundation
//import SwiftUI

class Startpage: ObservableObject {
    @Published var showWelcome: Bool = true
    
    init(showWelcome: Bool) {
        self.showWelcome = showWelcome
    }
}

