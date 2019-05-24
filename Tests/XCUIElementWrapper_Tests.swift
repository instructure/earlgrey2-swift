import XCTest
import SwiftUITest

class XCUIElementWrapper_Tests: SwiftUITestCase {
    lazy var button = app.find(id: "Main.button")
    lazy var buttonDisabled = app.find(id: "Main.buttonDisabled")
    lazy var hidden = app.find(id: "Main.hidden")
    lazy var label = app.find(id: "Main.label")
    lazy var missing = app.find(id: "missing")
    lazy var picker = app.find(id: "Main.picker")
    lazy var textField = app.find(id: "Main.textField")

    func test_exists() {
        XCTAssertTrue(button.exists)
        XCTAssertFalse(missing.exists)
    }

    func test_label() {
        XCTAssertEqual(button.label, "button")
        XCTAssertEqual(label.label, "text")
    }

    func test_id() {
        XCTAssertEqual(button.id, "Main.button")
    }

    func test_elementType() {
        XCTAssertEqual(button.elementType, XCElementType.button)
        XCTAssertEqual(label.elementType, XCElementType.staticText)
    }

    func test_isVisible() {
        XCTAssertTrue(label.isVisible)
        XCTAssertFalse(hidden.isVisible)
        XCTAssertFalse(missing.isVisible)
    }

    func test_isVisibleNow() {
        XCTAssertTrue(label.isVisibleNow)
        XCTAssertFalse(hidden.isVisibleNow)
        XCTAssertFalse(missing.isVisibleNow)
    }

    func test_value() {
        XCTAssertEqual(button.value, "value")
        XCTAssertEqual(buttonDisabled.value, "")
    }

    func test_isEnabled() {
        XCTAssertTrue(button.isEnabled)
        XCTAssertFalse(buttonDisabled.isEnabled)
    }

    func test_isEnabledNow() {
        XCTAssertTrue(button.isEnabledNow)
        XCTAssertFalse(buttonDisabled.isEnabledNow)
    }

    func test_pick() {
        picker.pick(column: 0, value: "B")
        picker.pick(column: 1, value: "4")
    }

    func test_tap() {
        XCTAssertEqual(button.label, "button")
        button.tap()
        XCTAssertEqual(button.label, "button (1)")
        button.tap()
        button.tap()
        XCTAssertEqual(button.label, "button (3)")
    }

    func test_tapAt() {
        XCTAssertEqual(button.label, "button")
        button.tapAt(.zero)
        XCTAssertEqual(button.label, "button (1)")
        button.tapAt(CGPoint(x: 10, y: 10))
        button.tapAt(CGPoint(x: 9000, y: 9000))
        XCTAssertEqual(button.label, "button (2)")
    }

    func test_typeText() {
        textField.typeText("fhqwhgads")
        XCTAssertEqual(textField.value, "fhqwhgads")
    }

    func test_swipeDown() {
        XCTAssertNoThrow(picker.swipeDown())
    }

    func test_swipeUp() {
        XCTAssertNoThrow(picker.swipeUp())
    }

    func test_waitToExist() {
        XCTAssertTrue(button.waitToExist(Timeout()))
        XCTAssertFalse(missing.waitToExist(Timeout(value: 1)))
    }

    func test_waitToVanish() {
        XCTAssertTrue(missing.waitToVanish(Timeout()))
        XCTAssertFalse(button.waitToVanish(Timeout(value: 1)))
    }
}
