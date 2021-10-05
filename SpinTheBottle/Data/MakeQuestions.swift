//
//  MakeQuestions.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 22/09/2021.
//

import CoreData

extension GameView {
    func makeQuestions() {
        let truths = ["Did you ever kissed someone you,ve met the same day?","What was the worst kiss you've ever had?","Who in this circle would you really want to kiss, and why?", "Who's your celebrity crush?", "What is the nastiest thing you've ever done to anyone?"]
        let dares = ["Close your eyes and eat whatever the group puts in your mouth (as long as it’s edible and safe, of course)", "Take of your shirt", "Spend 7 minutes in locked room in the dark with nearest person on your left that is opposite sex", "Sit with nothing but your underware for 3 minutes", "Exchange clothing item with person on your right"]
        if questions.isEmpty {
            for truth in truths {
                let newQuestion = Question(context: viewContext)
                newQuestion.type = "Truth"
                newQuestion.question = truth
                saveContext()
            }
            for dare in dares {
                let newTask = Question(context: viewContext)
                newTask.type = "Dare"
                newTask.question = dare
                saveContext()
            }
        }
    }
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            
        }
    }
    func delete() {
        for question in questions {
            viewContext.delete(question)
        }
        saveContext()
    }
    func getQuestion(type: String) -> Question {
        var array: [Question] = []
        for question in questions {
            if question.type == type {
                array.append(question)
            }
        }
        return array.randomElement() ?? array[0]
    }
}
