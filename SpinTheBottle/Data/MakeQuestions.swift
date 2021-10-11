//
//  MakeQuestions.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 22/09/2021.
//

import CoreData

extension GameView {
    func readFile() -> JSONData {
        var returnData: JSONData = JSONData(truths: [Truth](), dares: [Dare]())
        if let url = Bundle.main.url(forResource: "quests", withExtension: "json"),
            let data = try? Data(contentsOf: url) {
                let decoder = JSONDecoder()
                if let jsonData = try? decoder.decode(JSONData.self, from: data) {
                     returnData = jsonData
                }
            }
        return returnData
    }
    func makeQuestions() {
        let data = readFile()
        var truths: [Truth]
        var dares: [Dare]
        truths = data.truths
        dares = data.dares
        if questions.isEmpty {
            for truth in truths {
                let newQuestion = Question(context: viewContext)
                newQuestion.type = "Truth"
                newQuestion.question = truth.question
                saveContext()
            }
            for dare in dares {
                let newTask = Question(context: viewContext)
                newTask.type = "Dare"
                newTask.question = dare.dare
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
