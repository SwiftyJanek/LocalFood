//
//  LocalFoodApp.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

// Ausgangspunkt der App
import SwiftUI

@main
struct LocalFoodApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
