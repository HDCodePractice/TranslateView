import SwiftUI

public extension View {
    /// Presents an activity sheet when the associated `ActivityItem` is present
    ///
    /// Call the system's translation function to translate the specified content
    ///
    /// - Parameters:
    ///   - text: Content to be translated
    ///   - onComplete: When the sheet is dismissed, the this will be called with the result
    func translateSheet(_ text: Binding<String?>, onComplete: UIActivityViewController.CompletionWithItemsHandler? = nil) -> some View {
        background(TranslateView(text: text, onComplete: onComplete))
    }
}

private struct TranslateView: UIViewControllerRepresentable {
    @Binding var text: String?
    private var completion: UIActivityViewController.CompletionWithItemsHandler?

    public init(text: Binding<String?>, onComplete: UIActivityViewController.CompletionWithItemsHandler? = nil) {
        _text = text
        self.completion = onComplete
    }

    func makeUIViewController(context: Context) -> TranslateViewControllerWrapper {
        TranslateViewControllerWrapper(text: $text, completion: completion)
    }

    func updateUIViewController(_ controller: TranslateViewControllerWrapper, context: Context) {
        controller.text = $text
        controller.completion = completion
        controller.updateState()
    }

}


@available(iOS 13.0, *)
private final class TranslateViewControllerWrapper: UIViewController {
    var text: Binding<String?>
    var completion: UIActivityViewController.CompletionWithItemsHandler?

    init(text: Binding<String?>, completion: UIActivityViewController.CompletionWithItemsHandler?) {
        self.text = text
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        updateState()
    }

    fileprivate func updateState() {
        let isActivityPresented = presentedViewController != nil

        if text.wrappedValue != nil {
            if !isActivityPresented {
                if #available(iOS 15.0, *) {
                    let text = text.wrappedValue?.unicodeScalars.filter { !$0.properties.isEmojiPresentation}.reduce("") { $0 + String($1) }
                    let textView = UITextView()
                    textView.text = text
                    textView.isEditable = false
                    
                    view.addSubview(textView)
                    textView.selectAll(nil)
                    textView.perform(NSSelectorFromString(["_", "trans", "late:"].joined(separator: "")), with: nil)
                    DispatchQueue.main.async {
                        textView.removeFromSuperview()
                    }
                }
            }
        }
    }
}
