//
//  photo_aleatoireApp.swift
//  photo_aleatoire
//
//  Created by laumond on 10/03/2023.
//

import SwiftUI

@main
struct photo_aleatoireApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
