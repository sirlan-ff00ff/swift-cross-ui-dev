/// A text view.
public struct Text: View {
    /// The string to be shown in the text view.
    public var string: String
    /// Specifies whether the text should be wrapped if wider than its container.
    public var wrap: Bool

    public var body = EmptyViewContent()

    /// Creates a new text view with the given content.
    public init(_ string: String, wrap: Bool = true) {
        self.string = string
        self.wrap = wrap
    }

    public func asWidget(_ children: EmptyViewContent.Children) -> GtkLabel {
        let widget = GtkLabel()
        widget.lineWrapMode = .wordCharacter
        widget.horizontalAlignment = .start
        return widget
    }

    public func update(_ widget: GtkLabel, children: EmptyViewContent.Children) {
        widget.text = string
        widget.lineWrap = wrap
    }
}
