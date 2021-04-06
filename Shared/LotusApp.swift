//
//  LotusApp.swift
//  Shared
//
//  Created by Matthew Androus on 4/6/21.
//

import SwiftUI

@main
struct LotusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
