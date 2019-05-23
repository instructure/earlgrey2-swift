import Foundation
import XCTest

public struct Timeout {
    var value: TimeInterval

    public init(value: TimeInterval = 10) {
        self.value = value
    }
}

public protocol Element {
    var exists: Bool { get }
    var isVisible: Bool { get }
    var isVisibleNow: Bool { get }
    var value: String { get }
    var isEnabled: Bool { get }
    var isEnabledNow: Bool { get }
    var label: String { get }
    var id: String { get }
    var elementType: String { get }
    func tap()
    @discardableResult
    func waitToExist(_ timeout: Timeout) -> Bool
    func waitToVanish(_ timeout: Timeout)
    func typeText(_ text: String)
    func swipeDown()
    func swipeUp()
}

public protocol Driver {
    func find(label: String) -> Element
    func find(id: String) -> Element
    func find<T: ElementWrapper>(_ elementId: T) -> Element
    func find(type: String) -> Element
    func find(label: String, type: String) -> Element
    func find(id: String, type: String) -> Element
    func find<T: ElementWrapper>(_ elementId: T, type: String) -> Element

    func find(parentID: String, label: String) -> Element
    func find(parentID: String, type: String, index: Int) -> Element

    func swipeDown()
    func swipeUp()
}

public struct DriverFactory {
    public static func getXCUITestDriver(_ app: XCUIApplication, testCase: XCTestCase) -> Driver {
        return XCUITestDriver(app, testCase)
    }
    
    public static func getEarlGreyDriver() -> Driver {
        return EarlGreyDriver()
    }
}
