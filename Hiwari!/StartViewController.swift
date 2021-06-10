//
//  StartViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/06/06.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var addTaskButton: UIButton!
    @IBOutlet var gotoListButton: UIButton!
    @IBOutlet var iconImage : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       addTaskButton.layer.cornerRadius = 20
        gotoListButton.layer.cornerRadius = 20
        iconImage.layer.cornerRadius = 20
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
