import XCTest
import SwiftUITest

class XCUITestDriver_Tests: SwiftUITestCase {
    func test_swipeDown() {
        app.swipeDown()
    }

    func test_swipeUp() {
        app.swipeUp()
    }

    func test_find_label() {
        XCTAssertEqual(app.find(label: "first").label, "first")
    }
    
    func test_find_id() {
        XCTAssertEqual(app.find(id: "Main.label").id, "Main.label")
    }

    func test_find_elementWrapper() {
         XCTAssertTrue(app.find(Main.button).isVisibleNow)
    }

    func test_find_type() {
        XCTAssertEqual(app.find(type: XCElementType.button).elementType, XCElementType.button)
        XCTAssertEqual(app.find(type: XCElementType.picker).elementType, XCElementType.picker)
        XCTAssertEqual(app.find(type: XCElementType.staticText).elementType, XCElementType.staticText)
        XCTAssertEqual(app.find(type: XCElementType.textField).elementType, XCElementType.textField)
    }

    func test_find_label_type() {
        let element = app.find(label: "text", type: XCElementType.staticText)
        XCTAssertEqual(element.label, "text")
        XCTAssertEqual(element.elementType, XCElementType.staticText)
    }

    func test_find_id_type() {
        let element = app.find(id: "Main.button", type: XCElementType.button)
        XCTAssertEqual(element.id, "Main.button")
        XCTAssertEqual(element.elementType, XCElementType.button)
    }

    func test_find_elementWrapper_type() {
        let element = app.find(Main.button, type: XCElementType.button)
        XCTAssertEqual(element.elementType, XCElementType.button)
    }

    func test_find_parentID_label() {
        let child = app.find(parentID: "Main.segmented", label: "second")
        XCTAssertEqual(child.label, "second")
    }

    func test_find_parentID_type_index() {
        let child = app.find(parentID: "Main.segmented", type: XCElementType.button, index: 0)
        XCTAssertEqual(child.label, "first")
    }
}
