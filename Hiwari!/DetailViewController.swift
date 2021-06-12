//
//  DetailViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/06/08.
//

import UIKit
class DetailViewController: UIViewController {
    @IBOutlet var TaskLabel: UILabel!
    @IBOutlet var allpageLabel: UILabel!
    @IBOutlet var NokoriLabel: UILabel!
    @IBOutlet var FinishdateLabel: UILabel!
    @IBOutlet var CompleteTextField: UITextField!
    
    var task: String?
    var allpages: String?
    var nokoripage: String?
    var finishdate: String?
    var startdate: String?
    var notification: String?
        

    override func viewDidLoad() {
        super.viewDidLoad()
        TaskLabel.text = task//タスク名
        allpageLabel.text = allpages//総量
        FinishdateLabel.text = finishdate//終了日
        NokoriLabel.text = nokoripage //残数。これは計算する
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
