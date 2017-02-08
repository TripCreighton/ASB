//
//  AnnouncementsTVC.swift
//  ASB
//
//  Created by Jared Fitton on 1/10/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import UIKit

class AnnouncementsTVC: UITableViewController {

    private let announcements:Announcments! = Announcments()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.parent?.dismiss(animated: true, completion: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements.getAnnouncements().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnnouncementCell", for: indexPath) as! AnnouncementCell
        
        let announcementItem = announcements.getAnnouncements()[indexPath.row]
        
        cell._image.image = announcementItem.getImage()
        cell._titleLabel.text = announcementItem.getTitle()
        cell._dateTimeLabel.text = announcementItem.getDatePosted()
        cell._postedByLabel.text = announcementItem.getAuthor()

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEventVC" {
            let eventVC = segue.destination as? EventViewController
            
            if let selectedCell = sender as? AnnouncementCell {
                let tableIndex = tableView.indexPath(for: selectedCell)!
                let selectedAnnouncement = announcements.getAnnouncements()[tableIndex.row]
                eventVC?.announcement = selectedAnnouncement
            }
        }
    }
}
