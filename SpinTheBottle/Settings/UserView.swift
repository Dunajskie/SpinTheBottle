//
//  UserView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 16/09/2021.
//

import SwiftUI

struct UserView: View {
    var person: Person
    var body: some View {
        HStack {
            Text(person.avatar)
                .padding()
            Spacer()
            Text(person.name)
                .bold()
                .padding()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(person: Person())
    }
}
