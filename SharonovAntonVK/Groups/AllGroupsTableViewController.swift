//
//  AllGroupsTableViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire

class AllGroupsTableViewController: UITableViewController {
    
    @IBOutlet weak var allGroupsSearchBar: UISearchBar!
    
//    let allGroups = GroupMaker.makeGroups()
    var filteredGroups = [Group]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allGroupsSearchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if searching {
            return filteredGroups.count
//        }
//        return allGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupNameCell", for: indexPath) as! AllGroupsTableViewCell
        
        var group: Group
        
//        if searching {
            group = filteredGroups[indexPath.row]
//        } else {
//            group = allGroups[indexPath.row]
//        }
        
        cell.allGroupName.text = group.title
        cell.allGroupLogo.image = group.logo
        
        return cell
    }
}

extension AllGroupsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
//            filteredGroups = nil
        } else {
//            filteredGroups = allGroups.filter({ (groups: Group) -> Bool in
//                return groups.title.lowercased().contains(searchText.lowercased())
//            })
            searching = true
            
//            func searchGroups(searchText: searchText, completion: @escaping ([VKGroup]) -> Void) {

            AF.request("https://api.vk.com/method/groups.search",
                       parameters: [
                        "access_token": Session.instance.token,
                        "q": searchText,
                        "type": "group",
                        "v": Session.instance.apiVersion
            ]).responseJSON { response in
                print(response.value!)
            }
            
            
        }
        tableView.reloadData()
    }
}
