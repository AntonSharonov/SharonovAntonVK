//
//  FriendsTableViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet weak var friendsSearchBar: UISearchBar!
    
//    let friends = FriendsMaker.makeFriends()
    let friendsService = FriendsService()
    
    var vkFriends = [VKUser]()
    
    var friendSection = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        friendsSearchBar.delegate = self
        
        

        friendsService.loadFriendsData() { [weak self] friends in
            self?.vkFriends = friends
            self?.sortedFriends(friends: self!.vkFriends)
//            let myFriendsDict = Dictionary.init(grouping: friends) {
//                $0.firstName.first
//            }
//            self?.friendSection = myFriendsDict.map {
//                Section(title: String($0.key!), items: $0.value)
//            }
//            self?.friendSection.sort {
//                $0.title < $1.title
//            }
            self?.tableView?.reloadData()
//            print(self?.friendSection.count)
        }
        
      
        
        
        //        AF.request("https://api.vk.com/method/friends.get",
        //                   parameters: [
        //                    "access_token": Session.instance.token,
        //                    "user_id": Session.instance.userId,
        //                    "order": "name",
        //                    "count": "5",
        //                    "fields": "sex, bdate, city, status",
        //                    "v": "5.107"
        //        ]).responseJSON { response in
        //            print(response.value!)
        //        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendSection.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendSection[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendSection[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendNameCell", for: indexPath) as! FriendsTableViewCell
        
        cell.friendName.text = friendSection[indexPath.section].items[indexPath.row].firstName + " " + friendSection[indexPath.section].items[indexPath.row].lastName
        
        let url = URL(string: friendSection[indexPath.section].items[indexPath.row].photo50)
        cell.friendAvatar.image = UIImage(data: try! Data(contentsOf: url!))
        
        if friendSection[indexPath.section].items[indexPath.row].online == 1 {
            cell.friendOnline.image = UIImage(systemName: "circle.fill")
        }
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let friendsCollection = segue.destination as? FriendsPhotoesCollectionViewController {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let friend = friendSection[indexPath.section].items[indexPath.row]
//                friendsCollection.friendPhoto = friend
//                friendsCollection.title = "\(friendSection[indexPath.section].items[indexPath.row].firstName)'s photoes"
//            }
//        }
//    }
    
    func sortedFriends(friends: [VKUser]) {
        let userDictionary = Dictionary.init(grouping: friends, by: { $0.firstName.first })
        friendSection = userDictionary.map { Section(title: String($0.key!), items: $0.value) }
        friendSection.sort { $0.title < $1.title }
    }
}

//extension FriendsTableViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty {
//            sortedFriends(friends: friends)
//        } else {
//            let filteredUsers = friends.filter({ (friend: User) -> Bool in
//                return friend.name.lowercased().contains(searchText.lowercased())
//            })
//            sortedFriends(friends: filteredUsers)
//        }
//        tableView.reloadData()
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        sortedFriends(friends: friends)
//        tableView.reloadData()
//    }
//}

