//
//  Settings.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 10/09/2021.
//

import Foundation

class Settings: ObservableObject {
    @Published var numberOfPlayers = "4"
    @Published var mode = "Medium"
    @Published var circle = SpinerView(number: 4)
    @Published var persons: [Person] = [Person(avatar: "❓", name: "Add person details", points: 0, personID: 0),Person(avatar: "❓", name: "Add person details", points: 0, personID: 1),Person(avatar: "❓", name: "Add person details", points: 0, personID: 2),Person(avatar: "❓", name: "Add person details", points: 0, personID: 3)]
    @Published var selectedPerson: Int = 0
}
