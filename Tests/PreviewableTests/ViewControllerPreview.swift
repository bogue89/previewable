import XCTest
@testable import Previewable

final class ViewControllerPreviewTests: XCTestCase {

    func testViewControllerPreviewInitPassingReference() throws {
        let view = UIViewController()
        let _ = ViewControllerPreview(view)
    }

    func testViewControllerPreviewPassingInit() throws {
        let _ = ViewControllerPreview(UIViewController())
    }

    func testViewControllerPreviewPassingClosure() throws {
        let _ = ViewControllerPreview { UIViewController() }
    }

    func testViewControllerPreviewPassingClosureWithContext() throws {
        let _ = ViewControllerPreview { _ in UIViewController() }
    }

    func testViewControllerPreviewPassingAutoclosure() throws {
        let expectation = self.expectation(description: "expectation should never be fulfill")
        expectation.isInverted = true
        let _ = ViewControllerPreview(UIViewControllerTest(expectation))
        waitForExpectations(timeout: 1)
    }
}

private class UIViewControllerTest: UIViewController {

    init(_ expectation: XCTestExpectation) {
        super.init(nibName: nil, bundle: nil)
        expectation.fulfill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
