//
//  CalculateViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/05/24.
//

import UIKit

var Todotask = [String]()

class CalculateViewController: UIViewController {
    
    @IBOutlet var taskLabel : UILabel!
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

    @IBAction func TorikumuButton(_sender: Any){
         Todotask.append(taskLabel.text!)
       taskLabel.text = ""
        startdateLabel.text = ""
        finishdateLabel.text = ""
        dayTaskLabel.text = ""
        totalLabel.text = ""
        pageLabel.text = ""
        
        UserDefaults.standard.set( Todotask, forKey: "TodoList" )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLabel.text = taskName
        startdateLabel.text = startDate
        finishdateLabel.text = finishDate
        totalLabel.text = totalAmount
        pageLabel.text = pageName
        
        taskLabel.layer.borderColor = UIColor.black.cgColor
        self.taskLabel.layer.borderWidth = 0.3
    
        
        TorikumuButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
        
      
    
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
