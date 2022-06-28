import SwiftUI

public protocol ViewRepresentable: UIViewRepresentable {
    var view: (Context) -> UIView { get }
}

public extension ViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        view(context)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        // no op
    }
}

public struct ViewPreview: ViewRepresentable {
    public let view: (Context) -> UIView

    public init(_ view: @escaping ((Context) -> UIView)) {
        self.view = view
    }

    public init(_ view: @escaping (() -> UIView)) {
        self.init { _ in
            view()
        }
    }

    public init(_ view: @autoclosure @escaping (() -> UIView)) {
        self.init { _ in
            view()
        }
    }
}
