//
//  ContentView.swift
//  CoreMLSentimentAnalysis
//
//  Created by Bhavya Patel on 2025-09-22.
//

import SwiftUI
import NaturalLanguage

struct ContentView: View {
    @State private var inputText: String = ""
    
    private var sentimentScore: Double {
        let scoreString = analyzeSentiment(for: inputText)
        return Double(scoreString) ?? 0.0
    }
    
    private var sentimentDescription: String {
        if sentimentScore > 0.15 {
            return "Positive"
        } else if sentimentScore < -0.15 {
            return "Negative"
        } else {
            return "Neutral"
        }
    }
    
    private var sentimentColor: Color {
        // Interpolate between light red and light green
        if sentimentScore > 0.15 {
            // Positive: Light green
            return Color.green.opacity(0.2)
        } else if sentimentScore < -0.15 {
            // Negative: Light red
            return Color.red.opacity(0.2)
        } else {
            // Neutral: Light gray
            return Color.gray.opacity(0.2)
        }
    }
    
    private let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    private func analyzeSentiment(for stringToAnalyze: String) -> String {
        tagger.string = stringToAnalyze
        let (sentimentScore, _) = tagger.tag(at: stringToAnalyze.startIndex,
                                             unit: .paragraph,
                                             scheme: .sentimentScore)
        return sentimentScore?.rawValue ?? "0.0"
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Sentiment Analyzer")
                .font(.title)
                .padding(.top)
            
            TextField("Enter text", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            VStack {
                Text("Score: \(String(format: "%.2f", sentimentScore))")
                Text(sentimentDescription)
                    .font(.headline)
                    .foregroundColor(sentimentScore > 0.15 ? .green : (sentimentScore < -0.15 ? .red : .gray))
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(sentimentColor)
        .font(.system(size: 30))
        .multilineTextAlignment(.center)
    }
}

#Preview {
    ContentView()
}
