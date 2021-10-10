//
//  ContentView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 10/09/2021.
//

import SwiftUI

struct GameView: View {
    @Environment(\.managedObjectContext) var viewContext
    @StateObject var settings = Settings()
    @State private var showQuestionView = false
    @State private var showingActionSheet = false
    @State var questionType = ""
    var rotation: Double = 0.0
    @FetchRequest(sortDescriptors: [])
    var questions: FetchedResults<Question>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightPink
                    .edgesIgnoringSafeArea(.all)
                VStack(){
                    Group{
                        settings.circle
                            .frame(width: 300, height: 300, alignment: .center)
                            .shadow(radius: 5)
                            .padding()
                        Button(action: {
                            settings.selectedPerson = (Int.random(in: 1..<(Int(settings.numberOfPlayers) ?? 0)+1))
                            settings.circle.rotate(angle:  360 / Double((Int(settings.numberOfPlayers) ?? 0)) * Double(settings.selectedPerson) - Double(Int.random(in: 5...40)) - 90 + Double(Int.random(in: 1...4) * 360))
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            self.showingActionSheet.toggle()
                            }}, label: {
                                    Text( "PLAY" )
                                        .foregroundColor(.white)
                                        .frame(width: 200, height: 40)
                                        .background(Color.darkPink)
                                        .cornerRadius(15)
                                        .shadow(radius: 3)
                                        .padding()
                        })
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                     .actionSheet(isPresented: $showingActionSheet) {
                        ActionSheet(title: Text("Truth or dare?"), message: Text("Pick one"),
                            buttons:[ .default(Text("Truth")) { questionType = "Truth"
                                self.showQuestionView.toggle()
                            },
                          .default(Text("Dare")) { questionType = "Dare"
                            self.showQuestionView.toggle()
                          },
                          .cancel()])
                     }
                    .sheet(isPresented: $showQuestionView, content: {
                        NavigationView {
                            if questionType == "Truth" {
                                QuestionView(quest: getQuestion(type: "Truth"), questionType: questionType, person: settings.persons[settings.selectedPerson - 1])
                            } else {
                                QuestionView(quest: getQuestion(type: "Dare"), questionType: questionType, person: settings.persons[settings.selectedPerson - 1])
                            }
                        }
                    })
              }
              .toolbar {
                  ToolbarItemGroup(placement: .navigationBarTrailing) {
                      NavigationLink(destination: SettingsView()) {
                          Image(systemName: "slider.horizontal.3")
                      }
                      NavigationLink(destination: ScoresView()) {
                          Image(systemName: "circle.grid.cross")
                      }
                      NavigationLink(destination: AddToGameView( contentView: self)) {
                          Image(systemName: "plus")
                      }
                  }
              }
        }
        .onAppear {
            makeQuestions()
        }
        .accentColor( .black)
        
      }
        .environmentObject(settings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

