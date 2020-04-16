//
//  MyGroupsTableViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {
    
    var myGroups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupNameCell", for: indexPath) as! MyGroupsTableViewCell

        let group = myGroups[indexPath.row]
        cell.myGroupName.text = group.title
        cell.myGroupLogo.image = group.logo

        return cell
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            let allGroupsTableViewController = segue.source as! AllGroupsTableViewController
            
            if let indexPath = allGroupsTableViewController.tableView.indexPathForSelectedRow {
                let group = allGroupsTableViewController.allGroups[indexPath.row]
                
                if !myGroups.contains(where: { g -> Bool in
                    return group.title == g.title}) {
                    myGroups.append(group)
                
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

