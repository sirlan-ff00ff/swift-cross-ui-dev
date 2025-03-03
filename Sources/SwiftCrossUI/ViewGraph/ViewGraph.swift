public class ViewGraph<Root: App> {
    public typealias RootNode = ViewGraphNode<VStack<Root.Content>, Root.Backend>

    public var rootNode: RootNode
    private var cancellable: Cancellable?
    private var app: Root

    public init(for app: Root, backend: Root.Backend) {
        let vStack = VStack(app.body)
        rootNode = ViewGraphNode(for: vStack, backend: backend)

        self.app = app

        cancellable = app.state.didChange.observe {
            self.update()
        }
    }

    public func update() {
        rootNode.update(with: VStack(app.body))
    }
}
