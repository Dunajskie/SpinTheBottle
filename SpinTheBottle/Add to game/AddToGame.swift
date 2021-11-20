//
//  AddToGame.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 04/10/2021.
//

import SwiftUI

struct AddToGameView: View {
    @EnvironmentObject var settings: Settings
    @State var question = ""
    @State var dare = ""
    @State private var delete = false
    @State private var showingQuestionAlert = false
    @State private var showingDareAlert = false
    @State private var showingDeleteAlert = false
    var contentView: GameView
    
    var body: some View {
            Form {
                Section(header: Text(LocalizedStringKey("Add a question"))) {
                    TextField(LocalizedStringKey("Enter your question"), text: $question, onCommit: {
                        showingQuestionAlert = true
                    })
                }
                .alert(isPresented: $showingQuestionAlert) {
                    Alert(title: Text(LocalizedStringKey("Add a question")), message: Text(LocalizedStringKey("Sure to add question")),  primaryButton: .default(Text(LocalizedStringKey("Yes")), action: {
                        let newQuest = Question(context: contentView.viewContext)
                        newQuest.type =  "Truth"
                        newQuest.question = question
                        question = ""
                        contentView.saveContext()
                    }) , secondaryButton: .cancel(Text(LocalizedStringKey("No")), action: {question = ""}))
                }
                Section(header: Text(LocalizedStringKey("Add a dare"))) {
                    TextField(LocalizedStringKey("Enter your dare"), text: $dare, onCommit: {
                        showingDareAlert = true
                    })
                }
                .alert(isPresented: $showingDareAlert) {
                    Alert(title: Text(LocalizedStringKey("Add a dare")), message: Text(LocalizedStringKey("Sure to add dare")),  primaryButton: .default(Text(LocalizedStringKey("Yes")), action: {
                        let newQuest = Question(context: contentView.viewContext)
                        newQuest.type =  "Truth"
                        newQuest.question = dare
                        contentView.saveContext()
                        dare = ""
                    }) , secondaryButton: .cancel(Text(LocalizedStringKey("No")), action: {dare = ""}))
                }
                Section(header: Text(LocalizedStringKey("Delete"))) {
                    Toggle(LocalizedStringKey("Delete added questions and dares"), isOn: $delete)
                        .onChange(of: delete, perform: { value in
                            showingDeleteAlert = true })
                }
                .alert(isPresented: $showingDeleteAlert) {
                    Alert(title: Text(LocalizedStringKey("Delete your inputs")), message: Text(LocalizedStringKey("Want to delete")),  primaryButton: .default(Text(LocalizedStringKey("Yes")), action: {
                        contentView.delete()
                        delete = false
                    }) , secondaryButton: .cancel(Text(LocalizedStringKey("No")), action: {delete = false}))
                }
        }
            .navigationTitle(LocalizedStringKey("Add to game"))
    }
}
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
