//
//  ScoreView.swift
//  quiz
//
//  Created by SAP on 5/6/21.
//

import SwiftUI



struct ScoreView: View {
    
    var score: Int
    var totalQuestions: Int
    
// score vars
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Image("Image")
                    .resizable()
                                .scaledToFit()
                    

                Text("You got:")
                
                Text("\(score)/\(totalQuestions)")
                
              
            }
        }
    }
    
   
}


struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 2, totalQuestions: 3)
    }
}
