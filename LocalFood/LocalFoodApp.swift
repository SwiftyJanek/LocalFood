//
//  LocalFoodApp.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import SwiftUI

@main
struct LocalFoodApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
