//
//  SettingsView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 10/09/2021.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: Settings
    @State private var selectedMode = "Medium"
    let mode = ["Easy", "Medium", "Hard"]
    @State private var selectedNumber = "4"
    let numberOfPlayers = ["2","3","4","5","6","7","8"]
    @State var text = ""
    @State var truth = true

    var body: some View {
            Form {
                Section(header: Text(LocalizedStringKey("Players number"))) {
                    Picker(LocalizedStringKey("Number of players"), selection: $selectedNumber) {
                        ForEach(numberOfPlayers, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .onChange(of: selectedNumber, perform: { number in
                        settings.circle = SpinerView(number: Int(number) ?? 4)
                        settings.persons = []
                        for iter in 0..<(Int(number) ?? 0) {
                            settings.persons.append(Person(avatar: "❓", name: "Add person details", personID: iter))
                        }
                        settings.numberOfPlayers = number
                    })
                }
                Section(header: Text(LocalizedStringKey("Players details"))) {
                    List(settings.persons) { user in
                        NavigationLink(destination: UserSettingsView(user: user)) {
                            UserView(person: user)
                        }
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("Settings"))
            .onAppear{
                selectedNumber = settings.numberOfPlayers
            }
    }
}
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
