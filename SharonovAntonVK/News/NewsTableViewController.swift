//
//  NewsTableViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 15/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var news = NewsFactory.makeNews()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        let myNews = news[indexPath.row]
        cell.avatar.image = myNews.avatar
        cell.name.text = myNews.name
        cell.date.text = myNews.date
        cell.postText.text = myNews.postText
        cell.postImage.image = myNews.postImage

        return cell
    }
}
