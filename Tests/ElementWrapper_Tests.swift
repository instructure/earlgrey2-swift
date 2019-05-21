import Foundation

import XCTest
import SwiftUITest

class ElementId_Tests: SwiftUITestCase {

    public enum LoginPage: String, CaseIterable, ElementWrapper {
        case resetPassword
    }

    func test_elementId() {
        XCTAssertEqual(LoginPage.resetPassword.rawValue, "resetPassword")
        XCTAssertEqual(LoginPage.resetPassword.id, "LoginPage.resetPassword")

        // we can find directly with the enum
        XCTAssertFalse(LoginPage.resetPassword.isVisibleNow)
    }
}
