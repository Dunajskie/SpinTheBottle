//
//  Person.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 16/09/2021.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    var avatar: String = "Add person details"
    var name: String = "❓"
    var points: Int = 0
    var personID: Int = 0
}
