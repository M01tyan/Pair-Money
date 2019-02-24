//
//  HomeViewController.swift
//  Household
//
//  Created by 前田幹太 on 2019/02/14.
//  Copyright © 2019 M01tyan. All rights reserved.
//

import UIKit

struct houseHoldItem {
    var from:String?
    var to:String?
    var purpose:String?
    var memo:String?
    var amount:String?
}

struct editIndexPath {
    var section:String?
    var row:Int?
}

var listHouseHold: [String: [houseHoldItem]]? = ["02/16": [houseHoldItem(from: "さくら", to: "かんた", purpose: "娯楽", memo: "", amount: "500")], "02/17": [houseHoldItem(from: "かんた", to: "共同", purpose: "生活", memo: "", amount: "1000")]]

class HomeViewController: UITableViewController {
    var selectedCell: houseHoldItem?
    var selectedCellFromIndex:Int? = nil
    var selectedCellToIndex:Int? = nil
    var selectedCellPurposeIndex:Int? = nil
    var selectedCellMemo:String? = nil
    var selectedCellAmount:String? = nil
    @IBOutlet var houseHoldTable: UITableView!
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return listHouseHold!.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        return listHouseHold!.keys.sorted()[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionDate = listHouseHold!.keys.sorted()[section]
        return listHouseHold![sectionDate]!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let section = listHouseHold!.keys.sorted()[indexPath.section]
        cell.textLabel?.text = listHouseHold![section]![indexPath.row].from! + "->" + listHouseHold![section]![indexPath.row].to!
        cell.detailTextLabel?.text = listHouseHold![section]![indexPath.row].amount! + "円"
        switch listHouseHold![section]![indexPath.row].purpose! {
        case "生活": cell.backgroundColor = UIColor(red: 89/255, green: 255/255, blue: 44/255, alpha: 0.6)
        case "外食": cell.backgroundColor = UIColor(red: 255/255, green: 184/255, blue: 90/255, alpha: 0.6)
        case "娯楽": cell.backgroundColor = UIColor(red: 181/255, green: 108/255, blue: 255/255, alpha: 0.6)
        default: cell.backgroundColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 0.6)
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ViewController
        let section = listHouseHold!.keys.sorted()[(houseHoldTable.indexPathForSelectedRow?.section)!]
        selectedCell = listHouseHold![section]![(houseHoldTable.indexPathForSelectedRow?.row)!]
        let indexPath = editIndexPath(section: section, row: (houseHoldTable.indexPathForSelectedRow?.row)!)
        switch selectedCell!.from! {
        case "かんた": controller.editFromButtonIndex = 0
        default:  controller.editFromButtonIndex = 1
        }
        switch selectedCell!.to! {
        case "共同": controller.editToButtonIndex = 0
        case "かんた": controller.editToButtonIndex = 1
        default: controller.editToButtonIndex = 2
        }
        switch selectedCell!.purpose! {
        case "生活": controller.editPurposeButtonIndex = 0
        case "外食": controller.editPurposeButtonIndex = 1
        case "娯楽": controller.editPurposeButtonIndex = 2
        default: controller.editPurposeButtonIndex = 3
        }
        controller.editDate = section
        controller.editMemo = selectedCell!.memo!
        controller.editAmount = selectedCell!.amount!
        controller.editIndexPath = indexPath
    }
}
