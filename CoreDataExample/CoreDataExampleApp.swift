//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by César Pinto Castillo on 2023-07-25.
//

import SwiftUI

@main
struct CoreDataExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
