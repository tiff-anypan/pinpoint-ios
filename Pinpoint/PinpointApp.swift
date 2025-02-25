//
//  PinpointApp.swift
//  Pinpoint
//
//  Created by Tiffany Pan on 2/25/25.
//

import SwiftUI

@main
struct PinpointApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
