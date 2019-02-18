//
//  CheckViewController.swift
//  Household
//
//  Created by 前田幹太 on 2019/02/10.
//  Copyright © 2019 M01tyan. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var purposeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    var dateText:String? = ""
    var amountText:String? = ""
    var memoText:String? = ""
    var appendHouseHoldItem: houseHoldItem?
    var fromButton:[buttonStatus] = []
    var toButton:[buttonStatus] = []
    var objectButton:[buttonStatus] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = dateText
        amountLabel.text = amountText
        memoLabel.text = memoText
        for info in fromButton {
            if info.pushed == true {
                fromLabel.text = info.button!.titleLabel!.text!
            }
        }
        for info in toButton {
            if info.pushed == true {
                toLabel.text = info.button!.titleLabel!.text!
            }
        }
        for info in objectButton {
            if info.pushed == true {
                purposeLabel.text = info.button!.titleLabel!.text!
            }
        }
        appendListHouseHold()
    }
    
    func appendListHouseHold() {
        
        let newHouseHoldItem = houseHoldItem(from: fromLabel.text, to: toLabel.text, purpose: purposeLabel.text, memo: memoLabel.text, amount: amountLabel.text)
        if listHouseHold!.keys.contains(dateLabel.text!) {
            listHouseHold![dateLabel.text!]!.append(newHouseHoldItem)
        } else {
            listHouseHold![dateLabel.text!] = [newHouseHoldItem]
        }
    }
    
    @IBAction func goToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
