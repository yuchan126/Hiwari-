//
//  CalculateViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/05/24.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet var taskLabel : UILabel!
    @IBOutlet var startLabel : UILabel!
    @IBOutlet var finishLabel : UILabel!
    @IBOutlet var TorikumuButton : UIButton!
    @IBOutlet var pageLabel : UILabel!
    
    
    
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        

        
        taskLabel.layer.borderColor = UIColor.black.cgColor
        self.taskLabel.layer.borderWidth = 0.3
        
        startLabel.layer.borderColor = UIColor.black.cgColor
        self.startLabel.layer.borderWidth = 0.3
        
        finishLabel.layer.borderColor = UIColor.black.cgColor
        self.finishLabel.layer.borderWidth = 0.3
        
       pageLabel.layer.borderColor = UIColor.black.cgColor
        self.pageLabel.layer.borderWidth = 0.3
        
        
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
