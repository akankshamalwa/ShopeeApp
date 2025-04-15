//
//  ShopeeAppApp.swift
//  ShopeeApp
//
//  Created by Akanksha Dipak Bothe on 15/04/25.
//

import SwiftUI

@main
struct ShopeeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
