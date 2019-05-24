import Foundation
import XCTest

public extension XCUIElement {
    func toElement(_ testCase: XCTestCase) -> Element {
        return XCUIElementWrapper(self, testCase)
    }
}

struct XCUITestDriver: Driver {
    let app: XCUIApplication
    let testCase: XCTestCase
    
    init(_ app: XCUIApplication, _ testCase: XCTestCase) {
        self.app = app
        self.testCase = testCase
    }

    func swipeDown() {
        app.swipeDown()
    }

    func swipeUp() {
        app.swipeUp()
    }

    func find(label: String) -> Element {
       return app
            .descendants(matching: .any)
            .matching(NSPredicate(format: "%K == %@", #keyPath(XCUIElement.label), label))
            .firstMatch
            .toElement(testCase)
    }

    func find<T: ElementWrapper>(_ elementId: T) -> Element {
        return find(id: elementId.id)
    }

    func find(id: String) -> Element {
        return app
            .descendants(matching: .any)
            .matching(NSPredicate(format: "%K == %@", #keyPath(XCUIElement.identifier), id))
            .firstMatch
            .toElement(testCase)
    }

    func find(type: String) -> Element {
        return app
            .descendants(matching: XCElementType.from(type))
            .firstMatch
            .toElement(testCase)
    }

    func find(label: String, type: String) -> Element {
        return app
            .descendants(matching: XCElementType.from(type))
            .matching(NSPredicate(format: "%K == %@", #keyPath(XCUIElement.label), label))
            .firstMatch
            .toElement(testCase)
    }

    private func _find(id: String, type: String) -> XCUIElement {
        return app
            .descendants(matching: XCElementType.from(type))
            .matching(NSPredicate(format: "%K == %@", #keyPath(XCUIElement.identifier), id))
            .firstMatch
    }

    func find(id: String, type: String) -> Element {
        return _find(id: id, type: type).toElement(testCase)
    }

    func find<T: ElementWrapper>(_ elementId: T, type: String) -> Element {
        return find(id: elementId.id, type: type)
    }

    func find(parentID: String, label: String) -> Element {
        let element = _find(id: parentID, type: XCElementType.any)
        return element.descendants(matching: .any)
            .matching(NSPredicate(format: "%K == %@", #keyPath(XCUIElement.label), label))
            .firstMatch
            .toElement(testCase)
    }

    func find(parentID: String, type: String, index: Int) -> Element {
        let element = _find(id: parentID, type: XCElementType.any)
        return element.descendants(matching: XCElementType.from(type))
            .element(boundBy: index)
            .toElement(testCase)
    }
}
