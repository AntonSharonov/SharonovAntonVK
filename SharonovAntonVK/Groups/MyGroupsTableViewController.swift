//
//  MyGroupsTableViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class MyGroupsTableViewController: UITableViewController {
    
    //    var myGroups = GroupMaker.makeGroups()
    var vkGroups = [VKGroup]()
    let groupService = GroupService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        groupService.loadGroupsData() { [weak self] in
            //            self?.vkFriends = friends
            print("группы")
            self?.loadData()
//            self?.sortedFriends(friends: self!.vkFriends)
            self?.tableView?.reloadData()
        }
        //        friendsService.saveFriendsData(vkFriends)
        
    }
    
    func loadData() {
        do {
            let realm = try Realm()
            let groups = realm.objects(VKGroup.self)
            self.vkGroups = Array(groups)
            
            //            print(vkFriends)
        } catch {
            print(error)
        }
    }
    
//    groupService.loadGroupsData() { [weak self] in
//    self?.vkGroups = groups
//    self?.tableView.reloadData()
//    }
    
    //        AF.request("https://api.vk.com/method/groups.get",
    //                   parameters: [
    //                    "access_token": Session.instance.token,
    //                    "user_id": Session.instance.userId,
    //                    "extended": "1",
    //                    "v": "5.107"
    //        ]).responseJSON { response in
    //            print(response.value!)
    //        }
//}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vkGroups.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupNameCell", for: indexPath) as! MyGroupsTableViewCell
    
    let group = vkGroups[indexPath.row]
    cell.myGroupName.text = group.name
    //        cell.myGroupLogo.image = group.logo
    let url = URL(string: vkGroups[indexPath.row].photo50)
    cell.myGroupLogo.image = UIImage(data: try! Data(contentsOf: url!))
    
    return cell
}

//    @IBAction func addGroup(segue: UIStoryboardSegue) {
//        if segue.identifier == "addGroup" {
//            let allGroupsTableViewController = segue.source as! AllGroupsTableViewController
//
//            if let indexPath = allGroupsTableViewController.tableView.indexPathForSelectedRow {
//                let group = allGroupsTableViewController.allGroups[indexPath.row]
//
//                if !myGroups.contains(where: { g -> Bool in
//                    return group.title == g.title}) {
//                    myGroups.append(group)
//
//                    tableView.reloadData()
//                }
//            }
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//            myGroups.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
}

