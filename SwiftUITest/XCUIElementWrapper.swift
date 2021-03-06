import Foundation
import XCTest

struct XCUIElementWrapper: Element {
    let element: XCUIElement
    let testCase: XCTestCase

    init(_ element: XCUIElement, _ testCase: XCTestCase) {
        self.element = element
        self.testCase = testCase
    }

    var exists: Bool {
        waitToExist(Timeout())
        return element.exists
    }

    var label: String {
        waitToExist(Timeout())
        return element.label
    }

    var id: String {
        waitToExist(Timeout())
        return element.identifier
    }

    var elementType: String {
        waitToExist(Timeout())
        return XCElementType.from(element.elementType.rawValue)
    }

    var isVisible: Bool {
        waitToExist(Timeout())
        return isVisibleNow
    }

    var isVisibleNow: Bool {
        // must check exists before isHittable
        // isHittable triggers a search for the element
        // if the element doesn't exist then .isHittable will fail the test

        // an element can exist & still not be visible. XCUITest has no public concept of visiblity.
        // Computed invalid hit point (-1.0, 79.0)
        return element.exists && element.isHittable
    }

    var value: String {
        waitToExist(Timeout())
        return element.value as! String
    }

    var isEnabled: Bool {
        waitToExist(Timeout())
        return element.isEnabled
    }

    var isEnabledNow: Bool {
        return element.isEnabled
    }

    func pick(column: Int, value: String) {
        waitToExist(Timeout())
        element.pickerWheels.allElementsBoundByIndex[column].adjust(toPickerWheelValue: value)
    }

    func tap() {
        waitToExist(Timeout())
        element.tap()
    }

    func tapAt(_ point: CGPoint) {
        waitToExist(Timeout())
        element.coordinate(withNormalizedOffset: .zero)
            .withOffset(CGVector(dx: point.x, dy: point.y))
            .tap()
    }

    func typeText(_ text: String) {
        waitToExist(Timeout())
        element.tap()
        element.typeText(text)
    }

    func swipeDown() {
        waitToExist(Timeout())
        element.swipeDown()
    }

    func swipeUp() {
        waitToExist(Timeout())
        element.swipeUp()
    }

    @discardableResult
    func waitToExist(_ timeout: Timeout) -> Bool {
        // TODO: Wait for no more network activity, etc.
        if (element.exists) { return true; }
        return element.waitForExistence(timeout: timeout.value)
    }

    @discardableResult
    func waitToVanish(_ timeout: Timeout) -> Bool {
        let deadline = Date().addingTimeInterval(timeout.value)
        while element.exists, Date() < deadline {
            sleep(1)
        }
        return !element.exists
    }
}
