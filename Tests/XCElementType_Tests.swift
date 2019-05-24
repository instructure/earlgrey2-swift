import XCTest
@testable import SwiftUITest

class XCElementType_Tests: SwiftUITestCase {
    func test_ElementType_to_string() {
        XCTAssertEqual(XCElementType.any, ElementType.any.rawValue)
        XCTAssertEqual(XCElementType.other, ElementType.other.rawValue)
        XCTAssertEqual(XCElementType.segmentedControl, ElementType.segmentedControl.rawValue)
    }

    func test_from_string_to_ElementType() {
        XCTAssertEqual(XCElementType.from(XCElementType.any), XCUIElement.ElementType.any)
        XCTAssertEqual(XCElementType.from(XCElementType.other), XCUIElement.ElementType.other)
    }

    func test_from_uint_to_string() {
        XCTAssertEqual(XCElementType.from(0), XCElementType.any)
        XCTAssertEqual(XCElementType.from(1), XCElementType.other)
        XCTAssertEqual(XCElementType.from(XCUIElement.ElementType.segmentedControl.rawValue), XCElementType.segmentedControl)
    }

    func test_from_UISegment_to_ElementType() {
        XCTAssertEqual(XCElementType.from("UISegment"), XCUIElement.ElementType.segmentedControl)
    }
}
