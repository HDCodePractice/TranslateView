![ios](https://img.shields.io/badge/iOS-15-green)

# TranslateView

A SwiftUI view that enables you to properly present a iOS 15 `TranslateViewController`.

## Example

```swift
@State private var text: String?

var body: some View {
    Button {
        text = "Hello World"
    } label: {
        Text("translate")
    }
    .translateSheet($item)
}
```

## Installation

The code is packaged as a framework. You can install manually (by copying the files in the `Sources` directory) or using Swift Package Manager (__preferred__)

To install using Swift Package Manager, add this to the `dependencies` section of your `Package.swift` file:

`.package(url: "https://github.com/HDCodePractice/TranslateView.git", .upToNextMinor(from: "1.0.0"))`

> Note: The package requires iOS v15+
