//
//  News.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 16/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct News {
    var avatar: UIImage
    var name: String
    var date: String
    var postText: String
    var postImage: UIImage
}

final class NewsFactory {
    static func makeNews() -> [News] {
        let firstNews = News(avatar: UIImage(named: "swift3")!, name: "Taylor Swift", date: "Today 7:45", postText: "Taylor Swift does not hold back in her new music video, in which seems to target one of Hollywood’s highest-paid stars. The singer released a new video for “The Man”, which sees her transform into a man to make a statement about misogyny and male privilege. While fans were delighted to spot an Easter egg subtly condemning music manager Scooter Braun, a small contingent are wondering if one moment takes aim at Robert Downey Jr.", postImage: UIImage(named: "swift2")!
        )
        
        let secondNews = News(avatar: UIImage(systemName: "ant")!, name: "Animals", date: "Yesterday 23:15", postText: "The Animal Rescue Mission (ARM), a non-profit animal rescue organization based in Los Angeles officially launched The ARM COVID-19 Animal Support Program – an emergency response plan established to ensure that every pet owner in the Los Angeles area has access to a responsible, loving, and safe caregiver for their animal companions in the event of an emergency.", postImage: UIImage(named: "animal1")!
        )
        
        let thirdNews = News(avatar: UIImage(systemName: "sportscourt")!, name: "Sport", date: "Yesterday 10:25", postText: "In the UK, the Premier League has suspended fixtures, along with the FA, the English Football League and the Women's Super League. In a statement the league said it was unanimously decided to suspend the Premier League with the intention of returning on 4 April, subject to medical advice and conditions at the time. It intends to reschedule fixtures when it is safe to do so.", postImage: UIImage(named: "sport1")!
        )

        let news = [firstNews, secondNews, thirdNews]
        return news
    }
}

