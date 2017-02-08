//
//  Announcments.swift
//  ASB
//
//  Created by Trip Creighton on 1/17/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import Foundation
import UIKit

class Announcments {
    private var announcements:[AnnouncementItem]! = [AnnouncementItem]()
    
    //Setup all announcements here:
    init() {
        fetchAnnouncements()
        createNewAnnouncement(image: #imageLiteral(resourceName: "FruitBowl"), title: "Heyy", body: "What is up", date: "11/11/11", author: "Me")
    }
    
    //Manually create an announcement:
    private func createNewAnnouncement(image: UIImage, title: String, body: String, date: String, author: String) {
        if let newAnnouncement:AnnouncementItem = AnnouncementItem(image: image, title: title, body: body, date: date, author: author)! {
            announcements.append(newAnnouncement)
        } else {
            print("[\(Utilities().getTime())] Error creating new announcement! Array size: \(announcements.count)")
        }
        
    }
    
    //TODO: Fetches all announcements from the list on firebase:
    func fetchAnnouncements() {
        
    }
    
    //Returns announcements: 
    func getAnnouncements() -> [AnnouncementItem] {
        return announcements
    }
}

class AnnouncementItem {
    
    var image: UIImage,
    title: String,
    body: String,
    date: String,
    author: String
    
    init?(image: UIImage, title: String, body: String, date: String, author: String) {
        self.image = image
        self.body = body
        self.date = date
        self.author = author
        self.title = title
    }
    
    func getImage() -> UIImage {
        return self.image
    }
    
    func getAnnouncementText() -> String {
        return self.body
    }
    
    func getDatePosted() -> String {
        return self.date
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getAuthor() -> String {
        return self.author
    }
}
