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
                Section(header: Text("Add a question")) {
                    TextField("Enter your question", text: $question, onCommit: {
                        showingQuestionAlert = true
                    })
                }
                .alert(isPresented: $showingQuestionAlert) {
                    Alert(title: Text("Adding question"), message: Text("Are you sure that you want to add this question?"),  primaryButton: .default(Text("Yes"), action: {
                        let newQuest = Question(context: contentView.viewContext)
                        newQuest.type =  "Truth"
                        newQuest.question = question
                        question = ""
                        contentView.saveContext()
                    }) , secondaryButton: .cancel(Text("No"), action: {question = ""}))
                }
                Section(header: Text("Add a dare")) {
                    TextField("Enter your dare", text: $dare, onCommit: {
                        showingDareAlert = true
                    })
                }
                .alert(isPresented: $showingDareAlert) {
                    Alert(title: Text("Adding dare"), message: Text("Are you sure that you want to add this dare?"),  primaryButton: .default(Text("Yes"), action: {
                        let newQuest = Question(context: contentView.viewContext)
                        newQuest.type =  "Truth"
                        newQuest.question = dare
                        contentView.saveContext()
                        dare = ""
                    }) , secondaryButton: .cancel(Text("No"), action: {dare = ""}))
                }
                Section(header: Text("Add a dare")) {
                    Toggle("Delete added questions and dares", isOn: $delete)
                        .onChange(of: delete, perform: { value in
                            showingDeleteAlert = true })
                }
                .alert(isPresented: $showingDeleteAlert) {
                    Alert(title: Text("Delete your inputs"), message: Text("Are you sure that you want to delete all your added questions and dares?"),  primaryButton: .default(Text("Yes"), action: {
                        contentView.delete()
                        delete = false
                    }) , secondaryButton: .cancel(Text("No"), action: {delete = false}))
                }
        }
            .navigationTitle("Add to game")
    }
}
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
