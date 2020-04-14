//
//  FriendsTableViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends = FriendsMaker.makeFriends()
    
    var sortedFriends = [String: [User]]() {
        didSet {
            friends = sortedFriends.flatMap { $0.value }.sorted { $0.name < $1.name }
            tableView.reloadData()
        }
    }
    
    var sectionPrefix = [String]()
    var users = [User]()
    
    func sortFriends(with users: [User]) {
        
        sortedFriends = Dictionary(grouping: friends, by: { String($0.name.first!) })

        sectionPrefix = [String](sortedFriends.keys)
        sectionPrefix = sectionPrefix.sorted { $0 < $1 }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sortFriends(with: friends)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let friendsCollection = segue.destination as? FriendsPhotoesCollectionViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let friend = friends[indexPath.row]
                friendsCollection.friendPhoto = friend
                friendsCollection.title = "\(friend.name)'s photoes"
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendNameCell", for: indexPath) as! FriendsTableViewCell
        
        let friend = friends[indexPath.row]
        cell.friendName.text = friend.name
        cell.friendAvatar.image = friend.avatar

        return cell
    }
}

extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            clearSearch(searchBar)
            return
        }
        
        users = friends.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        clearSearch(searchBar)
    }
    
    func clearSearch(_ searchBar: UISearchBar) {
        searchBar.text = nil
        view.endEditing(true)
        friends = [User]()
    }
}
