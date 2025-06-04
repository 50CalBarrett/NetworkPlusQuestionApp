//
//  QuizView.swift
//  NetworkPlusNew
//
//  Created by NotBatman on 6/3/25.
//

import SwiftUI

import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel = QuizViewModel()
    @Binding var path: NavigationPath  // Passed in from WelcomeView

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Question \(viewModel.currentQuestionIndex + 1) of \(viewModel.questions.count)")
                        .font(.headline)

                    Text(viewModel.questions[viewModel.currentQuestionIndex].text)
                        .font(.title2)

                    let question = viewModel.questions[viewModel.currentQuestionIndex]
                    let requiredCount = question.correctAnswers.count

                    VStack(spacing: 10) {
                        ForEach(question.choices, id: \.self) { choice in
                            Button(action: {
                                viewModel.toggleAnswerSelection(choice)
                            }) {
                                HStack {
                                    Text(choice)
                                    Spacer()
                                    if viewModel.selectedAnswers.contains(choice) {
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                }
                                .padding()
                                .background(buttonColor(for: choice))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            .disabled(viewModel.hasAnswered)
                        }
                    }

                    if !viewModel.hasAnswered {
                        Button("Submit") {
                            viewModel.checkAnswer()
                        }
                        .disabled(viewModel.selectedAnswers.count != requiredCount)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }

                    if viewModel.hasAnswered {
                        Button("Next") {
                            viewModel.goToNextQuestion()
                            if viewModel.quizFinished {
                                // Navigate to results manually
                                path.append("results")
                            }
                        }
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }

                    Text("Score: \(viewModel.score)")
                        .font(.largeTitle)
                }
                .padding()
            }

            // ✅ Navigation trigger using path
            NavigationLink(value: "results") {
                EmptyView()
            }
        }
        // Register the destination using value matching
        .navigationDestination(for: String.self) { value in
            if value == "results" {
                ResultsView(
                    score: viewModel.score,
                    totalQuestions: viewModel.questions.count,
                    onRestart: {
                        viewModel.restartQuiz()
                        path.removeLast(path.count) // Go back to WelcomeView
                    }, path: $path
                )
            }
        }  
    }

    func buttonColor(for choice: String) -> Color {
        let question = viewModel.questions[viewModel.currentQuestionIndex]
        if viewModel.hasAnswered {
            if question.correctAnswers.contains(choice) {
                return Color.green
            } else if viewModel.selectedAnswers.contains(choice) {
                return Color.red
            } else {
                return Color.blue
            }
        } else {
            return viewModel.selectedAnswers.contains(choice) ? Color.green : Color.blue
        }
    }
}
