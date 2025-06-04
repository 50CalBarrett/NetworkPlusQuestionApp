//
//  WelcomeView.swift
//  NetworkPlusNew
//
//  Created by NotBatman on 6/3/25.
//

import SwiftUI
struct WelcomeView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 30) {
                Text("Welcome to the Network+ Review Quiz")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Text("""
                📋 Rules:
                • Multiple choice questions
                • Select the correct answer(s)
                • Get 6 wrong in a row? You restart!
                • ''IF'' you make it all the way to 
                    the end... You get a score.
                
                Are you freaking ready yet?
                """)
                .font(.body)
                .multilineTextAlignment(.leading)

                NavigationLink("Very nice! Wah WAh Wee WAh, here we go! 🚀") {
                    QuizView(path: $path)
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
        }
    }
}
