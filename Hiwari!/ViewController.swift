//
//  ViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/05/23.
//全部の項目を記入しないと次にいけないようなalertが出るようにする

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var pageView : UIView!
    @IBOutlet var notificationView : UIView!

    @IBOutlet var HiwariButton : UIButton!
    //textField
    @IBOutlet var TodoTextField : UITextField!
    @IBOutlet var amountTextField : UITextField!
    @IBOutlet var startdateTextField: UITextField!
    @IBOutlet var finishdateTextField:UITextField!
    //ラベル
    @IBOutlet var pageLabel : UILabel!
    @IBOutlet var notificationLabel : UILabel!
   //Keyboard
    @IBOutlet var pagepickerKeyoboard : PickerKeyboard3!
    @IBOutlet var notificationpickerKeyboard : PickerKeyboard4!
    


    override func viewDidLoad() {
        super.viewDidLoad()
 
        //pickerViewの設定
        pagepickerKeyoboard.pageLabel = pageLabel
        
        //ボタンの枠をつける
        pageView.layer.borderColor = UIColor.black.cgColor
        notificationView.layer.borderColor = UIColor.black.cgColor

        //ボタンの枠線
        self.pageView.layer.borderWidth = 0.3
        self.notificationView.layer.borderWidth = 0.3
        HiwariButton.layer.cornerRadius = 20
        
        
    }
    //画面遷移の話
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "CalculateViewController" {
               let next = segue.destination as? CalculateViewController
               next?.taskName = self.TodoTextField.text
            next?.totalAmount = self.amountTextField.text
            next?.pageName = self.pageLabel.text
            next?.startDate = self.startdateTextField.text
            next?.finishDate = self.finishdateTextField.text
           }
       }
    @IBAction func tapHiwariButton(_ sender: Any) {
            
            performSegue(withIdentifier: "CalculateViewController", sender: nil)
        }


}
    

