//
//  FriendsTableViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet weak var friendsSearchBar: UISearchBar!
    
    let friends = FriendsMaker.makeFriends()
    
    var friendSection = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsSearchBar.delegate = self
        sortedFriends(friends: friends)
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
          
        cell.friendName.text = friendSection[indexPath.section].items[indexPath.row].name
        cell.friendAvatar.image = friendSection[indexPath.section].items[indexPath.row].avatar
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let friendsCollection = segue.destination as? FriendsPhotoesCollectionViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let friend = friendSection[indexPath.section].items[indexPath.row]
                friendsCollection.friendPhoto = friend
                friendsCollection.title = "\(friendSection[indexPath.section].items[indexPath.row].name)'s photoes"
            }
        }
    }
    
    func sortedFriends(friends: [User]) {
        let userDictionary = Dictionary.init(grouping: friends, by: { $0.name.first! })
        friendSection = userDictionary.map { Section(title: String($0.key), items: $0.value) }
        friendSection.sort { $0.title < $1.title }
    }
}

extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            sortedFriends(friends: friends)
        } else {
            let filteredUsers = friends.filter({ (friend: User) -> Bool in
                return friend.name.lowercased().contains(searchText.lowercased())
            })
            sortedFriends(friends: filteredUsers)
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        sortedFriends(friends: friends)
        tableView.reloadData()
    }
}
