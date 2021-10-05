//
//  SpinTheBottleApp.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 10/09/2021.
//

import SwiftUI

@main
struct SpinTheBottleApp: App {
    let persistanceContainer = PersistanceController.shered
    var body: some Scene {
        WindowGroup {
            GameView()
                .environment(\.managedObjectContext, persistanceContainer.container.viewContext)
        }
    }
}
