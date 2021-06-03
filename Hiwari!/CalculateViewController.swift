//
//  CalculateViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/05/24.
//

import UIKit

var Todotask = [String]()

class CalculateViewController: UIViewController {
    
    @IBOutlet var taskNameLabel : UILabel!
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
    var number: Int = 0
    
    var wordArray: [Dictionary<String,String>]=[]
    let saveData = UserDefaults.standard
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let dateFormatter = DateFormatter()
    
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier:  "Asia/Tokyo")
         
        dateFormatter.dateFormat = "yyyy年M月d日(EEEEE)"
        
        let date = dateFormatter.date(from: "2020年4月25日(土)")
        print(date!)
        DateFormatter.date(from: String) -> date 
        
        
        if saveData.array(forKey: "WORD") != nil{
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        }
        
        taskNameLabel.text = taskName
        startdateLabel.text = startDate
        finishdateLabel.text = finishDate
        totalLabel.text = totalAmount
        pageLabel.text = pageName
        
        taskNameLabel.layer.borderColor = UIColor.black.cgColor
        self.taskNameLabel.layer.borderWidth = 0.3
    
        
        TorikumuButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    
    }
    @IBAction func TorikumuButton(_sender: Any){
        
        let taskDictionary = ["Name1": taskNameLabel.text!, "Name2": dayTaskLabel.text!]
        wordArray.append(taskDictionary)
        saveData.setValue(wordArray, forKey: "WORD")
        
     performSegue(withIdentifier: "TodoViewController", sender: nil)
        
         Todotask.append(taskNameLabel.text!)
       taskNameLabel.text = ""
        startdateLabel.text = ""
        finishdateLabel.text = ""
        dayTaskLabel.text = ""
        totalLabel.text = ""
        pageLabel.text = ""
        
        UserDefaults.standard.set( Todotask, forKey: "TodoList" )
            
            
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
