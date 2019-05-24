import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var button: UIButton?
    @IBOutlet weak var picker: UIPickerView?
    @IBOutlet weak var segmented: UISegmentedControl?
    @IBOutlet weak var textField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        button?.accessibilityValue = "value"
        segmented?.accessibilityIdentifier = "Main.segmented"
    }

    @IBAction func reset() {
        button?.setTitle("button", for: .normal)
        buttonTaps = 0
        picker?.selectRow(0, inComponent: 0, animated: false)
        picker?.selectRow(0, inComponent: 1, animated: false)
        segmented?.selectedSegmentIndex = 0
        textField?.text = ""
    }

    var buttonTaps = 0
    @IBAction func buttonTap() {
        buttonTaps += 1
        button?.setTitle(String(format: "button (%d)", buttonTaps), for: .normal)
    }
}

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? String(row + 10, radix: 36, uppercase: true) : String(row)
    }
}
