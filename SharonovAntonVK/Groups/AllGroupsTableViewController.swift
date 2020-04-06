//
//  AllGroupsTableViewController.swift
//  SharonovAntonVK
//
//  Created by mac on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    let allGroups = GroupMaker.makeGroups()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupNameCell", for: indexPath) as! AllGroupsTableViewCell

        let group = allGroups[indexPath.row]
        cell.allGroupName.text = group.title
        cell.allGroupLogo.image = group.logo
        
        return cell
    }
}
