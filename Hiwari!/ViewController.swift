//
//  ViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/05/23.
//全部の項目を記入しないと次にいけないようなalertが出るようにする

import UIKit


class ViewController: UIViewController {
    
   

   
    @IBOutlet var monthView2 : UIView!
    @IBOutlet var dateView2 : UIView!
    @IBOutlet var pageView : UIView!
    @IBOutlet var notificationView : UIView!
    @IBOutlet var startView : UIView!
    
    @IBOutlet var HiwariButton : UIButton!
    
    @IBOutlet var TodoTextField : UITextField!
    @IBOutlet var amountTextField : UITextField!
    
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var monthView1 : UIView!
    @IBOutlet var dateView1 : UIView!
    @IBOutlet var date1Label : UILabel!
    @IBOutlet var date2Label : UILabel!
    @IBOutlet var month1Label: UILabel!
    @IBOutlet var month2Label: UILabel!
    @IBOutlet var pageLabel : UILabel!
    @IBOutlet var notificationLabel : UILabel!
  
    @IBOutlet var date1pickerKeyboard : PickerKeyboard!
    @IBOutlet var date2pickerKeyboard : PickerKeyboard!
    @IBOutlet var month1pickerKeyboard : PickerKeyboard2!
    @IBOutlet var month2pickerKeyboard : PickerKeyboard2!
    @IBOutlet var pagepickerKeyoboard : PickerKeyboard3!
    @IBOutlet var notificationpickerKeyboard : PickerKeyboard4!
    @IBOutlet var startpickerKeyboard : DatePickerKeyboard!
    
   
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //pickerViewの設定
        date1pickerKeyboard.date1Label = date1Label
        date2pickerKeyboard.date2Label = date2Label
        month1pickerKeyboard.month1Label = month1Label
        month2pickerKeyboard.month2Label = month2Label
        pagepickerKeyoboard.pageLabel = pageLabel
        notificationpickerKeyboard.notificationLabel = notificationLabel
        startpickerKeyboard.startLabel = startLabel
    
        //ボタンの枠をつける
        monthView2.layer.borderColor = UIColor.black.cgColor
        dateView2.layer.borderColor = UIColor.black.cgColor
        dateView1.layer.borderColor = UIColor.black.cgColor
        pageView.layer.borderColor = UIColor.black.cgColor
        notificationView.layer.borderColor = UIColor.black.cgColor
        monthView1.layer.borderColor = UIColor.black.cgColor
        
        //ボタンの枠線
        self.dateView2.layer.borderWidth = 0.3
        self.dateView1.layer.borderWidth = 0.3
        self.monthView1.layer.borderWidth = 0.3
        self.monthView2.layer.borderWidth = 0.3
        self.pageView.layer.borderWidth = 0.3
        self.notificationView.layer.borderWidth = 0.3
        HiwariButton.layer.cornerRadius = 20
        
        
    }
    //画面遷移の話
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "CalculateViewController" {
               let next = segue.destination as? CalculateViewController
               next?.taskName = self.TodoTextField.text
            next?.startmonthName = self.month1Label.text
            next?.startdateName = self.date1Label.text
            next?.finishmonthName = self.month2Label.text
            next?.finishdateName = self.date2Label.text
            next?.totalAmount = self.amountTextField.text
            next?.pageName = self.pageLabel.text
           }
       }
    @IBAction func tapHiwariButton(_ sender: Any) {
            
            performSegue(withIdentifier: "CalculateViewController", sender: nil)
        }


}
    

