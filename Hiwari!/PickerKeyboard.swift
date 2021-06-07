
import UIKit


class DatePickerKeyboard2: UITextField {
    private var datePicker: UIDatePicker!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commoninit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
        
    }
    private func commoninit() {
        // datePickerの設定
        datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja")
        datePicker.addTarget(self, action: #selector(setText), for: .valueChanged)

        // textFieldのtextに日付を表示する
        setText()
        datePicker.preferredDatePickerStyle = .wheels
        inputView = datePicker
        inputAccessoryView = createToolbar()
    }

    // キーボードのアクセサリービューを作成する
    private func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)

        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 12
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePicker))
    

        let toolbarItems = [flexSpaceItem,doneButtonItem, space]

        toolbar.setItems(toolbarItems, animated: true)

        return toolbar
    }

    // キーボードの完了ボタンタップ時に呼ばれる
    @objc private func donePicker() {
        resignFirstResponder()
    }
    @objc private func todayPicker() {
            datePicker.date = Date()
            setText()
    }

    // datePickerの日付けをtextFieldのtextに反映させる
    @objc private func setText() {
        let f = DateFormatter()
        f.dateStyle = .long
        f.locale = Locale(identifier: "ja")
        text = f.string(from: datePicker.date)
    }
}

