//
//  TotalViewController.swift
//  PairMoney
//
//  Created by 前田幹太 on 2019/02/20.
//  Copyright © 2019 M01tyan. All rights reserved.
//

import UIKit

class TotalViewController: UIViewController {
    
    
    @IBOutlet var fromSakura: [UILabel]!
    @IBOutlet var fromKanta: [UILabel]!
    @IBOutlet var joint: [UILabel]!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var fromToLabel: UILabel!
    var fromSakuraToKanta:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for listDate in listHouseHold!.keys {
            for list in listHouseHold![listDate]! {
                let index:Int?
                let fromName:String?
                var amount:Int?
                switch list.from! {
                case "さくら": fromName = "さくら"
                case "かんた": fromName = "かんた"
                default: fromName = nil
                }
                switch list.to! {
                case "共同": index = 0
                default:
                    if list.to! == fromName! {
                      index = 3
                    } else {
                        index = 1
                    }
                }
                amount = Int(list.amount!)
                if index == 0 {
                    switch fromName! {
                    case "さくら":
                        joint[0].text = "\(Int(fromSakura[0].text!)! * 2 + amount!)"
                    case "かんた":
                        joint[1].text = "\(Int(fromKanta[0].text!)! * 2 + amount!)"
                    default: return
                    }
                    amount = amount! / 2
                }
                addSumAmount(from: fromName!, index: index!, amount: amount!)
            }
        }
    }
    
    func addSumAmount(from: String, index: Int, amount: Int) {
        switch from {
        case "さくら":
            fromSakura[index].text = "\(Int(fromSakura[index].text!)! + amount)"
            fromSakura[2].text = "\(Int(fromSakura[0].text!)! + Int(fromSakura[1].text!)!)"
        case "かんた":
            fromKanta[index].text = "\(Int(fromKanta[index].text!)! + amount)"
            fromKanta[2].text = "\(Int(fromKanta[0].text!)! + Int(fromKanta[1].text!)!)"
        default: return
        }
        var total:Int = Int(fromSakura[2].text!)! - Int(fromKanta[2].text!)!
        if total > 0 {
            fromToLabel.text = "か->さ"
        } else {
            total *= -1
            fromToLabel.text = "さ->か"
        }
        totalLabel.text = "\(total)"
    }
}
