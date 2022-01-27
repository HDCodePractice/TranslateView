![ios](https://img.shields.io/badge/iOS-15-green)

# TranslateView

A SwiftUI view that enables you to properly present a iOS 15 `TranslateViewController`.

![TranslateViewInPad](https://user-images.githubusercontent.com/1254855/151277590-a3ce5ee5-291e-4a93-9130-6ebd7be4c743.jpeg)

![TranslateViewInPhone](https://user-images.githubusercontent.com/1254855/151277612-caafa788-8dba-4edf-9725-9cbf86a7e68c.jpeg)

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
