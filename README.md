# CoreML Sentiment Analysis

A simple iOS app built with SwiftUI that performs real-time sentiment analysis on user input text using Apple's Natural Language framework.

## Features

- Real-time sentiment analysis as you type
- Visual feedback with color-coded backgrounds:
  - 🟢 Green for positive sentiment (score > 0.15)
  - 🔴 Red for negative sentiment (score < -0.15)
  - ⚪ Gray for neutral sentiment (-0.15 to 0.15)
- Displays numerical sentiment score (-1.0 to 1.0)
- Clean, intuitive SwiftUI interface

## Requirements

- iOS 14.0+
- Xcode 12.0+
- Swift 5.0+

## How to Use

1. Open the project in Xcode
2. Build and run the app on a simulator or device
3. Enter text in the text field
4. Watch as the sentiment score and background color update in real-time

## Technology Stack

- **SwiftUI** - User interface framework
- **Natural Language** - Apple's framework for text analysis and sentiment detection
- **CoreML** - Underlying machine learning framework used by Natural Language

## Author

Bhavya Patel

## License

This project is open source and available under the [MIT License](LICENSE).