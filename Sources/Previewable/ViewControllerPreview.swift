import SwiftUI

public protocol ViewControllerRepresentable: UIViewControllerRepresentable {
    var viewController: (Context) -> UIViewController { get }
}

public extension ViewControllerRepresentable {

    func makeUIViewController(context: Context) -> some UIViewController {
        viewController(context)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // no op
    }
}

public struct ViewControllerPreview: ViewControllerRepresentable {
    public let viewController: (Context) -> UIViewController
    
    public init(_ viewController: @escaping ((Context) -> UIViewController)) {
        self.viewController = viewController
    }

    public init(_ viewController: @escaping (() -> UIViewController)) {
        self.init { _ in
            viewController()
        }
    }

    public init(_ viewController: @autoclosure @escaping (() -> UIViewController)) {
        self.init { _ in
            viewController()
        }
    }
}
