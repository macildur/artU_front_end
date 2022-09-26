//
//  ArtUApp.swift
//  ArtU
//
//  Created by Joshua Higgins on 9/26/22.
//
//

import SwiftUI

@main
struct ArtUApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
