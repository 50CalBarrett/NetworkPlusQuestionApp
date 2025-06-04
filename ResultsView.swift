//
//  ResultsView.swift
//  NetworkPlusNew
//
//  Created by NotBatman on 6/3/25.
//

import SwiftUI

struct ResultsView: View {
    var score: Int
    var totalQuestions: Int
    var onRestart: () -> Void
    @Binding var path: NavigationPath  // <-- Add this binding

    var body: some View {
        VStack(spacing: 20) {
            Text("Quiz Complete!")
                .font(.largeTitle)

            Text("Your Score: \(score) out of \(totalQuestions)")
                .font(.title)

            Button("Exit to Home") {
                onRestart()
                path.removeLast(path.count) // ✅ Go back to WelcomeView
            }
            .font(.title2)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
