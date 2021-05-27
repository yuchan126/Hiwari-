//
//  date1pickerViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/05/26.
//
import UIKit

class PickerKeyboard: UIControl {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var date1Label : UILabel?
    var date2Label : UILabel?
    
    let array:[String] = ["1","2","3","4","5","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addTarget(self, action: #selector(tappedPickerKeyboard(_:)), for: .touchDown)
    }
    
    @objc func tappedPickerKeyboard(_ sender: PickerKeyboard) {
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

extension PickerKeyboard: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        date1Label.text = array[row]
        date2Label.text = array[row]
        
    }
    
}
