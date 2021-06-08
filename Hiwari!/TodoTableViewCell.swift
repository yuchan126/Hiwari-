//
//  TodoTableViewCell.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/06/02.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var taskamountLabel: UILabel!
    @IBOutlet var checkBox: UIButton!
    
    @IBAction func checkView(_ sender: CheckBox) {
            print(sender.isChecked)
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
