//
//  MakeQuestions.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 22/09/2021.
//

import CoreData

extension ContentView {
    func makeQuestions() {
        if questions.isEmpty {
        let newQuestion = Question(context: viewContext)
        newQuestion.type = "Truth"
        newQuestion.question = "Did you ever kissed someone you've met the same day?"
        saveContext()
        let newTask = Question(context: viewContext)
        newTask.type = "Dere"
        newTask.question = "You have to kiss the person sitting on the left"
        saveContext()
        }
    }
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            
        }
    }
}
