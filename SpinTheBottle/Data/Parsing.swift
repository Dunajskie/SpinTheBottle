//
//  Parsing.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 11/10/2021.
//

import Foundation

struct Truth: Codable {
    let question: String
}
struct Dare: Codable {
    let dare: String
}
struct JSONData: Codable {
    let truths: [Truth]
    let dares: [Dare]
}


