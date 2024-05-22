//
//  DepressionProjectAppApp.swift
//  DepressionProjectApp
//
//  Created by 한설 on 2024/05/23.
//

import SwiftUI

@main
struct DepressionProjectAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
