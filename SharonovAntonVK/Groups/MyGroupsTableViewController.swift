//
//  MyGroupsTableViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire

class MyGroupsTableViewController: UITableViewController {
    
    var myGroups = GroupMaker.makeGroups()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlConstructor = URLComponents()
              
              urlConstructor.scheme = "https"
              urlConstructor.host = "api.vk.com"
              urlConstructor.path = "/method/groups.get"
              urlConstructor.queryItems = [
                  URLQueryItem(name: "user_ids", value: String(Session.instance.userId)),
                  URLQueryItem(name: "extended", value: "1"),
                  URLQueryItem(name: "access_token", value: Session.instance.token),
                  URLQueryItem(name: "v", value: "5.107"),
              ]
              
              URLSession.shared.dataTask(with: urlConstructor.url!) { data, response, error in
                  
                  guard let data = data else { return }
                  
                  do {
                      let groups = try JSONDecoder().decode(GroupsResponse.self, from: data)
                      print(groups)
                  } catch {
                      print(error)
                  }
              }.resume()

//        AF.request("https://api.vk.com/method/groups.get",
//                   parameters: [
//                    "access_token": Session.instance.token,
//                    "user_id": Session.instance.userId,
//                    "extended": "1",
//                    "v": "5.107"
//        ]).responseJSON { response in
//            print(response.value!)
//        }
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

