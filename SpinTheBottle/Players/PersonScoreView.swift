//
//  PersonScoreView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 16/09/2021.
//

import SwiftUI

struct PersonScoreView: View {
    var person: Person
    
    var body: some View {
        HStack {
            Text(person.name == "Add person details" ? "Person" : person.name)
                .bold()
                .padding()
            Text(person.avatar)
            Spacer()
            Text(String(person.points))
                .bold()
                .padding()
        }
    }
}

struct PersonScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PersonScoreView(person: Person(avatar: "🐝", name: "Bee", points: 1))
    }
}
