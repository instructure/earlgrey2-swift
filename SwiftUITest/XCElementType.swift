import Foundation
import XCTest

enum ElementType : String, CaseIterable {
    static var intToStr: [UInt: String] {
        var result = Dictionary<UInt, String>()
        var index = UInt(0)
        ElementType.allCases.forEach { (element) in
            result[index] = element.rawValue
            index += 1
        }
        return result
    }

    static var strToInt: [String: UInt] {
        var result = Dictionary<String, UInt>()
        var index = UInt(0)
        ElementType.allCases.forEach { (element) in
            result[element.rawValue] = index
            index += 1
        }
        return result
    }

    case any
    case other
    case application
    case group
    case window
    case sheet
    case drawer
    case alert
    case dialog
    case button
    case radioButton
    case radioGroup
    case checkBox
    case disclosureTriangle
    case popUpButton
    case comboBox
    case menuButton
    case toolbarButton
    case popover
    case keyboard
    case key
    case navigationBar
    case tabBar
    case tabGroup
    case toolbar
    case statusBar
    case table
    case tableRow
    case tableColumn
    case outline
    case outlineRow
    case browser
    case collectionView
    case slider
    case pageIndicator
    case progressIndicator
    case activityIndicator
    case segmentedControl
    case picker
    case pickerWheel
    case `switch`
    case toggle
    case link
    case image
    case icon
    case searchField
    case scrollView
    case scrollBar
    case staticText
    case textField
    case secureTextField
    case datePicker
    case textView
    case menu
    case menuItem
    case menuBar
    case menuBarItem
    case map
    case webView
    case incrementArrow
    case decrementArrow
    case timeline
    case ratingIndicator
    case valueIndicator
    case splitGroup
    case splitter
    case relevanceIndicator
    case colorWell
    case helpTag
    case matte
    case dockItem
    case ruler
    case rulerMarker
    case grid
    case levelIndicator
    case cell
    case layoutArea
    case layoutItem
    case handle
    case stepper
    case tab
    case touchBar
    case statusItem
}

// TODO: convert strings to/from XCUIElement.Types
public struct XCElementType  {
    public static func from(_ type: String) -> XCUIElement.ElementType {
        let found: ElementType
        switch type {
        case "UISegment": found = .segmentedControl
        default: found = ElementType(rawValue: type) ?? .any
        }
        let keyNumber = ElementType.strToInt[found.rawValue] ?? 0
        return XCUIElement.ElementType.init(rawValue: keyNumber) ?? XCUIElement.ElementType.any
    }

    public static func from(_ index: UInt) -> String {
        return ElementType.intToStr[index] ?? ElementType.any.rawValue
    }

    public static let any: String = ElementType.any.rawValue
    public static let other: String = ElementType.other.rawValue
    public static let application: String = ElementType.application.rawValue
    public static let group: String = ElementType.group.rawValue
    public static let window: String = ElementType.window.rawValue
    public static let sheet: String = ElementType.sheet.rawValue
    public static let drawer: String = ElementType.drawer.rawValue
    public static let alert: String = ElementType.alert.rawValue
    public static let dialog: String = ElementType.dialog.rawValue
    public static let button: String = ElementType.button.rawValue
    public static let radioButton: String = ElementType.radioButton.rawValue
    public static let radioGroup: String = ElementType.radioGroup.rawValue
    public static let checkBox: String = ElementType.checkBox.rawValue
    public static let disclosureTriangle: String = ElementType.disclosureTriangle.rawValue
    public static let popUpButton: String = ElementType.popUpButton.rawValue
    public static let comboBox: String = ElementType.comboBox.rawValue
    public static let menuButton: String = ElementType.menuButton.rawValue
    public static let toolbarButton: String = ElementType.toolbarButton.rawValue
    public static let popover: String = ElementType.popover.rawValue
    public static let keyboard: String = ElementType.keyboard.rawValue
    public static let key: String = ElementType.key.rawValue
    public static let navigationBar: String = ElementType.navigationBar.rawValue
    public static let tabBar: String = ElementType.tabBar.rawValue
    public static let tabGroup: String = ElementType.tabGroup.rawValue
    public static let toolbar: String = ElementType.toolbar.rawValue
    public static let statusBar: String = ElementType.statusBar.rawValue
    public static let table: String = ElementType.table.rawValue
    public static let tableRow: String = ElementType.tableRow.rawValue
    public static let tableColumn: String = ElementType.tableColumn.rawValue
    public static let outline: String = ElementType.outline.rawValue
    public static let outlineRow: String = ElementType.outlineRow.rawValue
    public static let browser: String = ElementType.browser.rawValue
    public static let collectionView: String = ElementType.collectionView.rawValue
    public static let slider: String = ElementType.slider.rawValue
    public static let pageIndicator: String = ElementType.pageIndicator.rawValue
    public static let progressIndicator: String = ElementType.progressIndicator.rawValue
    public static let activityIndicator: String = ElementType.activityIndicator.rawValue
    public static let segmentedControl: String = ElementType.segmentedControl.rawValue
    public static let picker: String = ElementType.picker.rawValue
    public static let pickerWheel: String = ElementType.pickerWheel.rawValue
    public static let `switch`: String = ElementType.switch.rawValue
    public static let toggle: String = ElementType.toggle.rawValue
    public static let link: String = ElementType.link.rawValue
    public static let image: String = ElementType.image.rawValue
    public static let icon: String = ElementType.icon.rawValue
    public static let searchField: String = ElementType.searchField.rawValue
    public static let scrollView: String = ElementType.scrollView.rawValue
    public static let scrollBar: String = ElementType.scrollBar.rawValue
    public static let staticText: String = ElementType.staticText.rawValue
    public static let textField: String = ElementType.textField.rawValue
    public static let secureTextField: String = ElementType.secureTextField.rawValue
    public static let datePicker: String = ElementType.datePicker.rawValue
    public static let textView: String = ElementType.textView.rawValue
    public static let menu: String = ElementType.menu.rawValue
    public static let menuItem: String = ElementType.menuItem.rawValue
    public static let menuBar: String = ElementType.menuBar.rawValue
    public static let menuBarItem: String = ElementType.menuBarItem.rawValue
    public static let map: String = ElementType.map.rawValue
    public static let webView: String = ElementType.webView.rawValue
    public static let incrementArrow: String = ElementType.incrementArrow.rawValue
    public static let decrementArrow: String = ElementType.decrementArrow.rawValue
    public static let timeline: String = ElementType.timeline.rawValue
    public static let ratingIndicator: String = ElementType.ratingIndicator.rawValue
    public static let valueIndicator: String = ElementType.valueIndicator.rawValue
    public static let splitGroup: String = ElementType.splitGroup.rawValue
    public static let splitter: String = ElementType.splitter.rawValue
    public static let relevanceIndicator: String = ElementType.relevanceIndicator.rawValue
    public static let colorWell: String = ElementType.colorWell.rawValue
    public static let helpTag: String = ElementType.helpTag.rawValue
    public static let matte: String = ElementType.matte.rawValue
    public static let dockItem: String = ElementType.dockItem.rawValue
    public static let ruler: String = ElementType.ruler.rawValue
    public static let rulerMarker: String = ElementType.rulerMarker.rawValue
    public static let grid: String = ElementType.grid.rawValue
    public static let levelIndicator: String = ElementType.levelIndicator.rawValue
    public static let cell: String = ElementType.cell.rawValue
    public static let layoutArea: String = ElementType.layoutArea.rawValue
    public static let layoutItem: String = ElementType.layoutItem.rawValue
    public static let handle: String = ElementType.handle.rawValue
    public static let stepper: String = ElementType.stepper.rawValue
    public static let tab: String = ElementType.tab.rawValue
    public static let touchBar: String = ElementType.touchBar.rawValue
    public static let statusItem: String = ElementType.statusItem.rawValue
}
