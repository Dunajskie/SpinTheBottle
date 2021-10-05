//
//  Persistance.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 22/09/2021.
//

import CoreData

struct PersistanceController {
    static let shered = PersistanceController()
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "QuestionList")
        container.loadPersistentStores { storeDescription, error in
            if (error as NSError?) != nil {
                fatalError()
            }
        }
    }
}
