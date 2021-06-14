//
//  ListTableViewController.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/06/02.
//

import UIKit





class ListTableViewController: UITableViewController  {
    
    var Taskname: String?
    var start: String?
    var finish : String?
    var total: String?
    var pageUnit: String?
    var dayTask: String?
    var notification: String?


    var wordArray: [Dictionary<String,String>] = []
    let saveData = UserDefaults.standard
    
    var index : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //Userdefaultsの設定(データがあるならそれを取得し更新する)
        if saveData.array(forKey: "WORD") != nil{
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String,String>]
        }
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                //表示するcell数
                return wordArray.count
            }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let TodoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
            
            let nowIndexpathDictionary = wordArray[indexPath.row]
            TodoCell.todoLabel.text = nowIndexpathDictionary["Name1",default: "Name2"]
            TodoCell.taskamountLabel.text = nowIndexpathDictionary["Name2"]
            TodoCell.CheckBox.index = indexPath.row
            
            if wordArray[indexPath.row]["Checked"] == "YES" {
                       TodoCell.CheckBox.isChecked = true
                   } else {
                       TodoCell.CheckBox.isChecked = false
                   }
            return TodoCell
       
                           }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            return true
        }

        //スワイプしたセルを削除　
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
                wordArray.remove(at: indexPath.row)
                UserDefaults.standard.set(wordArray, forKey: "WORD" )
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
        }
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        index = indexPath.row
        
       performSegue(withIdentifier: "Gotodetail", sender: nil)
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           let detailViewController = segue.destination as! DetailViewController
            detailViewController.index = index!
            
            if segue.identifier == "Gotodetail" {
                if tableView.indexPathForSelectedRow != nil {
                    guard segue.destination is DetailViewController else {
                                fatalError("Failed to prepare DetailViewController.")
                            }
                let next = segue.destination as? DetailViewController
             next?.task = self.Taskname
             next?.allpages = self.total
                next?.startdate = self.start
                next?.finishdate = self.finish
                next?.notification = self.notification
            }
    
        }
    


    }

}


   

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
