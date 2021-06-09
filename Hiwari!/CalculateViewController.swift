//
//  CalculateViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/05/24.
//

import UIKit



class CalculateViewController: UIViewController {
    
    @IBOutlet var taskNameLabel : UILabel!   //タスク名
    @IBOutlet var startdateLabel: UILabel!
    @IBOutlet var finishdateLabel: UILabel!
    @IBOutlet var TorikumuButton : UIButton!
    @IBOutlet var dayTaskLabel : UILabel!
    @IBOutlet var totalLabel : UILabel!
    @IBOutlet var pageLabel: UILabel!
  
    var taskName: String?
    var startDate: String?
    var finishDate : String?
    var totalAmount: String?
    var pageName: String?
    var dayTask: String?
    var number: Double?
    var notification: String?
    
    var wordArray: [Dictionary<String,String>]=[]
    let saveData = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskNameLabel.text = taskName
        startdateLabel.text = startDate
        finishdateLabel.text = finishDate
        totalLabel.text = totalAmount
        pageLabel.text = pageName
        dayTaskLabel.text = dayTask
       
        
        taskNameLabel.layer.borderColor = UIColor.black.cgColor
        self.taskNameLabel.layer.borderWidth = 0.3
    
        
        TorikumuButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    
    
        //値の変換
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        let date1 = dateFormatter.date(from: startDate!)
        let date2 = dateFormatter.date(from: finishDate!)
    //日付の計算
        func getIntervalDays(date:Date?,anotherDay:Date? = nil) -> Double {
            var retInterval:Double!
            if anotherDay == nil {
                retInterval = date?.timeIntervalSinceNow
            } else {
                retInterval = date?.timeIntervalSince(anotherDay!)
            }
            let ret = retInterval/86400
            return floor(ret)  // n日
        }
// ex. ２つの日付の差
    
        number = Double(Int(totalLabel.text!)!)/(getIntervalDays(date: date2,anotherDay: date1))
        let roundedValue = (number)!.rounded(.up)
        let suji:Double = roundedValue
        let sNum5:String = "\(suji)"
        dayTaskLabel.text = (String(sNum5) + pageName!)
      
    }
    @IBAction func TorikumuButton(_sender: Any){
        
        let taskDictionary = ["Name1": taskNameLabel.text!, "Name2": dayTaskLabel.text!]
        if saveData.array(forKey: "WORD") != nil{
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
         performSegue(withIdentifier: "TodoViewController", sender: nil)
        }
        wordArray.append(taskDictionary)
        saveData.setValue(wordArray, forKey: "WORD")
        saveData.setValue(notification, forKey: "Notification")
        saveData.setValue(finishDate,forKey:"Finishdate")
        saveData.object(forKey: "Checkbox")
        }
  
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

