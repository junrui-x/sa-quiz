//
//  ContentView.swift
//  quiz
//
//  Created by SAP on 5/6/21.
//

import SwiftUI



struct ContentView: View {
    
    var question = [Question(title: "What day is it?",
                             option1: "Monday",
                             option2: "Friday",
                             option3: "Wednesday",
                             option4: "Saturday",
                             correctOption: 4),
                    
                    Question(title: "What framework are we using?",
                             option1: "UIKit",
                             option2: "SwiftUI",
                             option3: "React Native",
                             option4: "Flutter",
                             correctOption: 2),
                    
                    Question(title: "Which company created Swift?",
                             option1: "Apple",
                             option2: "Orange",
                             option3: "Google",
                             option4: "Tinkercademy",
                             correctOption: 1),
                    
                    Question(title: "2+4=?",
                             option1: "6",
                             option2: "7",
                             option3: "0",
                             option4: "9",
                             correctOption: 1)]
    
    // list of questions + answers
    
    
    
    @State var questionNumber = 0
    @State var isAlertPresented = false
    @State var isCorrect = false
    @State var correctAnswers = 0
    @State var isModalPresented = false
    
    // state vars
    
    var body: some View {
        
        ZStack {
            Color.purple.ignoresSafeArea()
            VStack {
                Text(question[questionNumber].title)
                    .padding()
                HStack {
                    VStack {
                        Button {
                            didTapOption(optionNumber: 1)
                        } label: {
                            Image(systemName: "triangle.fill")
                            Text(question[questionNumber].option1)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        
                        Button {
                            didTapOption(optionNumber: 3)
                        } label: {
                            Image(systemName: "square.fill")
                            Text(question[questionNumber].option3)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.red)
                        .foregroundColor(.white)
                        
                    }
                    VStack {
                        Button {
                            didTapOption(optionNumber: 2)
                        } label: {
                            Image(systemName: "rhombus.fill")
                            Text(question[questionNumber].option2)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.green)
                        .foregroundColor(.white)
                        
                        Button {
                            didTapOption(optionNumber: 4)
                        } label: {
                            Image(systemName: "cone.fill")
                            Text(question[questionNumber].option4)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                               , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        
                    }
                    // options
                    
                }
                
            }
            .alert(isPresented: $isAlertPresented){
                Alert(title: Text(isCorrect ? "Correct" : "Wrong"),
                      // alert title
                      message: Text(isCorrect ? "Congrats, you got the question correct" : "This is outrageous, with such easy questions, how can you be getting this wrong?!"),
                      // alert message
                      dismissButton: .default(Text("OK")) {
                        questionNumber += 1
                        
                        if questionNumber == question.count {
                            isModalPresented = true
                            questionNumber = 0
                        }
                        
                      })
                // alert dismiss button & question number increment
            }
            .sheet(isPresented: $isModalPresented,
                   onDismiss: {
                    correctAnswers = 0
                   },
                   content: {
                    ScoreView(score: correctAnswers,
                              totalQuestions: question.count)
                   })
        }
        
        
        // what the score board will show me
        
        
        
    }
    
    
    
    func didTapOption(optionNumber: Int) {
        if optionNumber == question[questionNumber].correctOption {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
            
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
    // func to determine if option is correct
    
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

