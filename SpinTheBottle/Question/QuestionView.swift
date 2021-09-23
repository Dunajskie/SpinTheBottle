//
//  QuestionView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 10/09/2021.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var settings: Settings
    @ObservedObject var quest: Question
    var questionType: String
    var person: Person
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(questionType == "Truth" ? "Your question:" : "Your task:")
                        .bold()
                        .padding()
                    Text(questionType == "Truth" ? "\(person.name == "Add person details" ? "Person" : person.name), \((quest.question ?? ""))" : "\(person.name == "Add person details" ? "Person" : person.name), \((quest.question ?? ""))")
                    Spacer()
                }
                
                Spacer()
                VStack {
                    Button(action: {
                            settings.persons[settings.selectedPerson-1].points += 1
                            print(settings.persons[settings.selectedPerson-1].points)
                            self.presentationMode.wrappedValue.dismiss()}) {
                        Text("I GOT IT!")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 30)
                            .background(Color.green)
                            .cornerRadius(7)
                            .padding(4)
                    }
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Text("DIDN'T MAKE IT")
                            .foregroundColor(.white)
                            .frame(width: 300, height: 30)
                            .background(Color.red)
                            .cornerRadius(7)
                            
                    }
                    .padding(.bottom)
                }
            }
        }
        .navigationTitle("\(questionType) for \(person.name == "Add person details" ? "Person" : person.name) \(person.avatar)")
    }
}

//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView(questionType: "Dare", person: Person(avatar: "", name: "", points: 0, personID: 0))
//    }
//}
