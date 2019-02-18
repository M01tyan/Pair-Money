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

var listHouseHold: [String: [houseHoldItem]]? = ["2019/02/16": [houseHoldItem(from: "さくら", to: "かんた", purpose: "娯楽", memo: "", amount: "500")], "2019/02/17": [houseHoldItem(from: "かんた", to: "共同", purpose: "生活", memo: "", amount: "1000")]]

class HomeViewController: UITableViewController {
    
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
        default: cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(listHouseHold!["2019/02/16"])
    }
}
