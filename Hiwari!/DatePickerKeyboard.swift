import UIKit

class DatePickerKeyboard: UIControl {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var startLabel:UILabel?
    
    let dayOfMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        var monthIndex = 0
        
        init(bounds: CGRect) {
            let baseWidth = 375.0
            let baseHeight = 260.0
            let viewRate = Double(bounds.width) / baseWidth
            let pickerRect = CGRect(x: 0, y: 0, width: baseWidth * viewRate, height: baseHeight * viewRate)
            super.init(frame: pickerRect)
            commonInit()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        func getMonthAndDay() -> String {
            let month = "\(pickerView.selectedRow(inComponent: 0) + 1)月"
            let day = "\(pickerView.selectedRow(inComponent: 1) + 1)日"
            return month + day
        }
        
        private func commonInit() {
            let view = Bundle.main.loadNibNamed("MonthAndDayPicker", owner: self, options: nil)?.first as! UIView
            view.frame = self.bounds
            view.translatesAutoresizingMaskIntoConstraints = true
            view.autoresizingMask = .flexibleWidth
            self.addSubview(view)
            
            // Pickerの設定
            pickerView.delegate = self
        }
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 2
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch component {
            case 0:
                return dayOfMonth.count
            case 1:
                return dayOfMonth[monthIndex]
            default:
                return 0
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if component == 0 {
                return "\(row + 1)月"
            } else if component == 1 {
                return "\(row + 1)日"
            } else {
                return nil
            }
        }
     
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if component == 0 {
                // 選択している月が変わった場合最終日が変わるので、日を再生成する
                monthIndex = row
                pickerView.reloadComponent(1)
            }
        }
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addTarget(self, action: #selector(tappedPickerKeyboard(_:)), for: .touchDown)
    }
    
    @objc func tappedPickerKeyboard(_ sender: PickerKeyboard2) {
        becomeFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        view.frame = CGRect(x: 0, y: 0, width: frame.width, height: 44)
        
        let finishButton = UIButton(type: .custom)
        finishButton.setTitle("Done", for: .normal)
        finishButton.sizeToFit()
        finishButton.addTarget(self, action: #selector(tappedCloseButton(_:)), for: .touchUpInside)
        finishButton.setTitleColor(UIColor(red: 0, green: 122/255, blue: 1, alpha: 1.0), for: .normal)
        
        view.contentView.addSubview(finishButton)
        
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.widthAnchor.constraint(equalToConstant: finishButton.frame.size.width).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: finishButton.frame.size.height).isActive = true
        finishButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        return view
    }
    
    override var inputView: UIView? {
        
        let pickerView: UIPickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.white
        pickerView.autoresizingMask = [.flexibleHeight]
        
        // SafeAreaに対応させる為にUIViewを挟む
        let view = UIView()
        view.backgroundColor = .white
        view.autoresizingMask = [.flexibleHeight]
        view.addSubview(pickerView)
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        return view
    }
    
    @objc private func tappedCloseButton(_ sender: UIButton) {
        resignFirstResponder()
    }
}

extension DatePickerKeyboard: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // delegateなどでViewControllerに選択された情報を渡す
       startLabel?.text = array[row]
        
    }
}
