import Foundation

import XCTest
import SwiftUITest

public enum Main: String, ElementWrapper {
    case button
    case missing
    case picker
    case textField
}

class ElementWrapper_Tests: SwiftUITestCase {
    func test_id() {
        XCTAssertEqual(Main.button.id, "Main.button")
    }

    func test_properties() {
        let wrapper = Main.button
        let element = wrapper.element
        XCTAssertEqual(wrapper.accessibilityIdentifier, element.id)
        XCTAssertEqual(wrapper.elementType, element.elementType)
        XCTAssertEqual(wrapper.exists, element.exists)
        XCTAssertEqual(wrapper.isEnabled, element.isEnabled)
        XCTAssertEqual(wrapper.isEnabledNow, element.isEnabledNow)
        XCTAssertEqual(wrapper.isVisible, element.isVisible)
        XCTAssertEqual(wrapper.isVisibleNow, element.isVisibleNow)
        XCTAssertEqual(wrapper.label, element.label)
        XCTAssertEqual(wrapper.value, element.value)
    }

    func test_funcs() {
        XCTAssertNoThrow(Main.picker.pick(column: 0, value: "A"))
        XCTAssertNoThrow(Main.picker.swipeDown())
        XCTAssertNoThrow(Main.picker.swipeUp())
        XCTAssertNoThrow(Main.button.tap())
        XCTAssertNoThrow(Main.button.tapAt(.zero))
        XCTAssertNoThrow(Main.textField.typeText("A"))
        XCTAssertNoThrow(Main.button.waitToExist(Timeout()))
        XCTAssertNoThrow(Main.missing.waitToExist(Timeout()))
    }
}
