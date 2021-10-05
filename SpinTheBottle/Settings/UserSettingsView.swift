//
//  UserSettingsView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 16/09/2021.
//

import SwiftUI

struct UserSettingsView: View {
    @EnvironmentObject var settings: Settings
    let user: Person
    @State var name = "Name"
    @State var avatar = "🐶"
    var avatars = ["🐶","🐹","🦊","🐼","🐨","🦁","🐸","🐺","🦄","🦋"]
    @State var avatarChanged = false
    @State var nameChanged = false
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Enter your name", text: $name, onCommit: {
                    nameChanged = true
                })
                }
            Section(header: Text("Avatar")) {
                Picker("Pick your avatar", selection: $avatar) {
                    ForEach(avatars, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .onChange(of: avatar, perform: { avatar in
                    avatarChanged = true
                })
            }
        }
        .navigationTitle("Details")
        .onDisappear(perform: {
            if nameChanged {
                var index = 0
                for person in settings.persons {
                    if person.id == user.id {
                        settings.persons[index].name = name
                    }
                    index += 1
                }
            }
            if avatarChanged {
                var index = 0
                for person in settings.persons {
                    if person.id == user.id {
                        settings.persons[index].avatar = avatar
                    }
                    index += 1
                }
            }
        })
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView(user: Person())
    }
}
