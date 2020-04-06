//
//  FriendsTableViewController.swift
//  SharonovAntonVK
//
//  Created by mac on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends = FriendsMaker.makeFriends()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
