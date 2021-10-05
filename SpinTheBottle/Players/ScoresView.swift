//
//  PersonView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 16/09/2021.
//

import SwiftUI

struct ScoresView: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        List(settings.persons) { person in
            PersonScoreView(person: person)
        }
        .navigationTitle("Scores")
        .accentColor( .black)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}
