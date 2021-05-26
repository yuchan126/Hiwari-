//
//  ViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/05/23.
//全部の項目を記入しないと次にいけないようなalertが出るようにする

import UIKit

var taskName = [String]()
var pageNumber = [String]()










class ViewController: UIViewController {
   
    @IBOutlet var monthButton2 : UIButton!
    @IBOutlet var dateButton2 : UIButton!
    @IBOutlet var pageButton : UIButton!
    @IBOutlet var notificationButton : UIButton!
    @IBOutlet var HiwariButton : UIButton!
    @IBOutlet var TodoTextField : UITextField!
    @IBOutlet var monthButton1 : UIButton!
    @IBOutlet var date1Label: UILabel!
    
    @IBAction func HiwariButton (_sender: Any){
        taskName.append(TodoTextField.text!)
        TodoTextField.text = ""
        UserDefaults.standard.set(taskName,forKey: "TodoList")
    }
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //pickerViewの設定
        
        
        //ボタンの枠をつける
        monthButton1.layer.borderColor = UIColor.black.cgColor
        monthButton2.layer.borderColor = UIColor.black.cgColor
        dateButton2.layer.borderColor = UIColor.black.cgColor
        pageButton.layer.borderColor = UIColor.black.cgColor
        notificationButton.layer.borderColor = UIColor.black.cgColor
        date1Label.layer.borderColor = UIColor.black.cgColor
       
        
        //ボタンの枠線
        
        self.dateButton2.layer.borderWidth = 0.3
        self.monthButton1.layer.borderWidth = 0.3
        self.monthButton2.layer.borderWidth = 0.3
        self.pageButton.layer.borderWidth = 0.3
        self.notificationButton.layer.borderWidth = 0.3
        self.date1Label.layer.borderWidth = 0.3
        HiwariButton.layer.cornerRadius = 20
        
    }


}

