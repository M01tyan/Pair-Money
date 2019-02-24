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
    case colorGray = 5
}

struct buttonStatus {
    var button: UIButton?
    var pushed: Bool?
}

class ViewController: UIViewController {
    var editDate:String?
    var editFromButtonIndex:Int?
    var editToButtonIndex:Int?
    var editPurposeButtonIndex:Int?
    var editMemo:String?
    var editAmount:String?
    var editIndexPath:editIndexPath?
    
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
        case "Gray":
            red = 67/255; green = 67/255; blue = 67/255
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
                    case 3: color = "Gray"
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
    @IBOutlet weak var editBackButton: UIBarButtonItem!
    @IBOutlet weak var editTitleLabel: UINavigationItem!
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
        if editFromButtonIndex != nil {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM/dd"
            formatter.locale = Locale(identifier: "ja_JP")
            let inputDate = formatter.date(from: editDate!)
            date.date = inputDate!
            editBackButton.isEnabled = true
            editTitleLabel.title = "編集"
            payments[editFromButtonIndex!].pushed = true
            switch editFromButtonIndex! {
            case 0: backgroundChange(color: "Blue", pushButton: payments[editFromButtonIndex!].button!)
            default: backgroundChange(color: "Pink", pushButton: payments[editFromButtonIndex!].button!)
            }
            toButtons[editToButtonIndex!].pushed = true
            switch editToButtonIndex! {
            case 0: backgroundChange(color: "Green", pushButton: toButtons[editToButtonIndex!].button!)
            case 1: backgroundChange(color: "Blue", pushButton: toButtons[editToButtonIndex!].button!)
            default: backgroundChange(color: "Pink", pushButton: toButtons[editToButtonIndex!].button!)
            }
            objectButtons[editPurposeButtonIndex!].pushed = true
            switch editPurposeButtonIndex! {
            case 0: backgroundChange(color: "Green", pushButton: objectButtons[editPurposeButtonIndex!].button!)
            case 1: backgroundChange(color: "Orange", pushButton: objectButtons[editPurposeButtonIndex!].button!)
            case 2: backgroundChange(color: "Purple", pushButton: objectButtons[editPurposeButtonIndex!].button!)
            default: backgroundChange(color: "Gray", pushButton: objectButtons[editPurposeButtonIndex!].button!)
            }
            amount.text = editAmount!
            memo.text = editMemo!
        }
    }
    
    @IBAction func backEditPage(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! CheckViewController
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        controller.dateText = formatter.string(from: date.date)
        controller.amountText = amount.text
        controller.memoText = memo.text
        controller.fromButton = payments
        controller.toButton = toButtons
        controller.objectButton = objectButtons
        controller.editIndexPath = editIndexPath
    }
}
