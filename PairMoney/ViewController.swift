//
//  ViewController.swift
//  Household
//
//  Created by 前田幹太 on 2019/02/03.
//  Copyright © 2019 M01tyan. All rights reserved.
//

import UIKit

enum actionTag: Int {
    case colorBlue = 0
    case colorPink = 1
    case colorGreen = 2
    case colorYellow = 3
    case colorRed = 4
}

struct buttonStatus {
    var button: UIButton?
    var pushed: Bool?
}

class ViewController: UIViewController {
    
    func backgroundChange(color: String, pushButton: UIButton) {
        var red:CGFloat?
        var green:CGFloat?
        var blue:CGFloat?
        switch color {
        case "Blue":
            red = 180/255; green = 227/255; blue = 255/255
        case "Pink":
            red = 252/255; green = 172/255; blue = 255/255
        case "Green":
            red = 89/255; green = 255/255; blue = 44/255
        case "Orange":
            red = 255/255; green = 184/255; blue = 90/255
        case "Purple":
            red = 181/255; green = 108/255; blue = 255/255
        default:
            red = 255/255; green = 255/255; blue = 255/255
        }
        pushButton.backgroundColor = UIColor(red: red!, green: green!, blue: blue!, alpha: 0.4)
    }
    
    
    @IBOutlet var fromButton: [CustomButton]!
    var payments: [buttonStatus] = []
    @IBAction func paymentOnlyOne(_ sender: Any) {
        if let button = sender as? UIButton {
            for (index, chengeButton) in payments.enumerated() {
                if !(chengeButton.button == button) {
                    backgroundChange(color: "White", pushButton: chengeButton.button!)
                    payments[index].pushed = false
                } else {
                    var color:String? = ""
                    switch index {
                    case 0: color = "Blue"
                    case 1: color = "Pink"
                    default: return
                    }
                    backgroundChange(color: color!, pushButton: chengeButton.button!)
                    payments[index].pushed = true
                }
            }
        }
    }
    
    @IBOutlet var whatTodo: [CustomButton]!
    var toButtons: [buttonStatus] = []
    @IBAction func whatTodoOnlyOne(_ sender: Any) {
        if let button = sender as? UIButton {
            for (index, chengeButton) in toButtons.enumerated() {
                if !(chengeButton.button == button) {
                    backgroundChange(color: "White", pushButton: chengeButton.button!)
                    toButtons[index].pushed = false
                } else {
                    var color:String? = ""
                    switch index {
                    case 0: color = "Green"
                    case 1: color = "Blue"
                    case 2: color = "Pink"
                    default: return
                    }
                    backgroundChange(color: color!, pushButton: chengeButton.button!)
                    toButtons[index].pushed = true
                }
            }
        }
    }
    
    @IBOutlet var object: [CustomButton]!
    var objectButtons: [buttonStatus] = []
    @IBAction func objectOnlyOne(_ sender: Any) {
        if let button = sender as? UIButton {
            for (index, chengeButton) in objectButtons.enumerated() {
                if !(chengeButton.button == button) {
                    backgroundChange(color: "White", pushButton: chengeButton.button!)
                    objectButtons[index].pushed = false
                } else {
                    var color:String? = ""
                    switch index {
                    case 0: color = "Green"
                    case 1: color = "Orange"
                    case 2: color = "Purple"
                    default: return
                    }
                    backgroundChange(color: color!, pushButton: chengeButton.button!)
                    objectButtons[index].pushed = true
                }
            }
        }
    }
    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var memo: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    override func viewDidLoad() {
        amount.keyboardType = UIKeyboardType.numberPad
        for button in fromButton {
            payments.append(buttonStatus(button: button, pushed: false))
        }
        for button in whatTodo {
            toButtons.append(buttonStatus(button: button, pushed: false))
        }
        for button in object {
         objectButtons.append(buttonStatus(button: button, pushed: false))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! CheckViewController
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        controller.dateText = formatter.string(from: date.date)
        controller.amountText = amount.text
        controller.memoText = memo.text
        controller.fromButton = payments
        controller.toButton = toButtons
        controller.objectButton = objectButtons
    }
    @IBAction func goToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
