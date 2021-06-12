//
//  ContentView.swift
//  quiz
//
//  Created by SAP on 5/6/21.
//

import SwiftUI



struct ContentView: View {
    
    var Questions = [Question(title: "What day is it?",
                              option1: "Monday",
                              option2: "Saturday",
                              option3: "Wednesday",
                              option4: "Friday"),
                     Question(title: "What framework are we using?",
                              option1: "UIKit",
                              option2: "SwiftUI",
                              option3: "React Native",
                              option4: "Flutter"),
                     Question(title: "Which company created Swift?",
                              option1: "Orange",
                              option2: "Apple",
                              option3: "Google",
                              option4: "Tinkercademy"),
                     Question(title: "Where is Singapore",
                              option1: "Somewhere in China",
                              option2: "Just below Malaysia",
                              option3: "Below Trump's wall",
                              option4: "What Singapore, never heard of it"),
                     Question(title: "2+3=?",
                              option1: "????",
                              option2: "5",
                              option3: "2",
                              option4: "10")
    ]
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
                Text(Questions[questionNumber].title)
                    .padding()
                HStack {
                    VStack {
                        Button(  Questions[questionNumber].option1){
                            didTapOption(optionNumber: 1)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                            , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        Button(Questions[questionNumber].option3){
                            didTapOption(optionNumber: 3)
                        }
                        .padding()
                        .frame(width: 160, height: 75
                            , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.red)
                        .foregroundColor(.white)
                    }
                    VStack {
                        Button( Questions[questionNumber].option2){
                            didTapOption(optionNumber: 2)
                            // this is the correct answer
                        }
                        .padding()
                        .frame(width: 160, height: 75
                            , alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.green)
                        .foregroundColor(.white)
                        
                        Button( Questions[questionNumber].option4){
                            didTapOption(optionNumber: 4)
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
                        
                        if questionNumber == Questions.count {
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
                              totalQuestions: Questions.count)
               })
        }
        
        
        // what the score board will show me
        
        
        
    }
    
    
    
    func didTapOption(optionNumber: Int) {
        if optionNumber == 2 {
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

