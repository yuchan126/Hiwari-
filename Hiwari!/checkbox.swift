//
//  checkbox.swift
//  Hiwari!
//
//  Created by Yuma Ikeda on 2021/06/03.
//

import UIKit

class CheckBox: UIButton {

    // Images
    let checkedImage = UIImage(named: "checked.png")! as UIImage
        let uncheckedImage = UIImage(named: "unchecked.png")! as UIImage

        // Bool property
        var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: UIControl.State.normal)
                } else {
                    self.setImage(uncheckedImage, for: UIControl.State.normal)
                }
            }
        }

        override func awakeFromNib() {
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
            self.isChecked = false
        }

    @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
    }
