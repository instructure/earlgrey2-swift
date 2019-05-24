import Foundation
import XCTest

// Enable defining enums that have a string element id and then invoking methods on them.
//
//  enum LoginPage: String, CaseIterable, ElementWrapper {
//      case resetPassword
//  }

public protocol ElementWrapper : Element {
    var id: String { get }
    var element: Element { get }
}

// Provide default 'id' implementation for enums
public extension ElementWrapper where Self: RawRepresentable, Self.RawValue: StringProtocol {
    var id: String {
        return "\(String(describing: Self.self)).\(rawValue)"
    }
}

// Forward method calls to the underlying element
public extension ElementWrapper {
    var exists: Bool {
        return element.exists
    }

    var label: String {
        return element.label
    }

    // renamed to 'accessibilityIdentifier' to avoid conflict with 'id' defined by 'extension ElementId'
    var accessibilityIdentifier: String {
        return element.id
    }

    var elementType: String {
        return element.elementType
    }

    var isVisible: Bool {
        return element.isVisible
    }

    var isVisibleNow: Bool {
        return element.isVisibleNow
    }

    var value: String {
        return element.value
    }

    var isEnabled: Bool {
        return element.isEnabled
    }

    var isEnabledNow: Bool {
        return element.isEnabledNow
    }

    func pick(column: Int, value: String) {
        element.pick(column: column, value: value)
    }

    func tap() {
        element.tap()
    }

    func tapAt(_ point: CGPoint) {
        element.tapAt(point)
    }

    func typeText(_ text: String) {
        element.typeText(text)
    }

    func swipeDown() {
        element.swipeDown()
    }

    func swipeUp() {
        element.swipeUp()
    }

    func waitToExist(_ timeout: Timeout) -> Bool {
        return element.waitToExist(timeout)
    }

    func waitToVanish(_ timeout: Timeout) -> Bool {
        return element.waitToVanish(timeout)
    }
}
