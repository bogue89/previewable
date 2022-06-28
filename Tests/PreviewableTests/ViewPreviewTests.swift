import XCTest
@testable import Previewable

final class ViewPreviewTests: XCTestCase {

    func testViewPreviewInitPassingReference() throws {
        let view = UIView()
        let _ = ViewPreview(view)
    }

    func testViewPreviewPassingInit() throws {
        let _ = ViewPreview(UIView())
    }

    func testViewPreviewPassingClosure() throws {
        let _ = ViewPreview { UIView() }
    }

    func testViewPreviewPassingClosureWithContext() throws {
        let _ = ViewPreview { _ in UIView() }
    }

    func testViewPreviewPassingAutoclosure() throws {
        let expectation = self.expectation(description: "expectation should never be fulfill")
        expectation.isInverted = true
        let _ = ViewPreview(UIViewTest(expectation))
        waitForExpectations(timeout: 1)
    }
}

private class UIViewTest: UIView {

    init(_ expectation: XCTestExpectation) {
        super.init(frame: .zero)
        expectation.fulfill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
