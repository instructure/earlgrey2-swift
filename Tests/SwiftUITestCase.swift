import XCTest
import SwiftUITest

var app: Driver!

extension ElementWrapper {
    public var element: Element {
        return app.find(id: id)
    }
}

class SwiftUITestCase: XCTestCase {
    private static let xcuiApp = XCUIApplication()
    let xcuiApp = SwiftUITestCase.xcuiApp

    lazy var resetButton = app.find(id: "reset")
    func reset() {
        resetButton.tap()
    }

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        xcuiApp.activate()
        app = DriverFactory.getXCUITestDriver(xcuiApp, testCase: self)
        reset()
    }
}
