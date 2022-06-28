import SwiftUI


public extension PreviewProvider {
    static func preview<T>(_ view: @autoclosure @escaping () -> T) -> some View where T: UIView {
        ViewPreview(view)
    }

    static func preview<T>(_ viewController: @autoclosure @escaping () -> UIViewController) -> some View where T: UIViewController {
        ViewControllerPreview(viewController)
    }
}
