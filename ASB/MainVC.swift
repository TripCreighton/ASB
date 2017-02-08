//
//  ViewController.swift
//  ASB
//
//  Created by Trip Creighton on 1/6/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    //Storyboard outlets:
    @IBOutlet var scrollView: UIScrollView!,
                  announcementsView: UIView!,
                  shopView: UIView!,
                  annPrevTV: AnnouncementPreviewTV!
    //Constants:
    private let utils:Utilities = Utilities(),
                greenColor = UIColor(r: 38, g: 57, b: 30, a: 255),
                goldColor = UIColor(r: 155, g: 122, b: 41, a: 255),
                asbMembers = ASBMembers(),
                memberViewWidth:CGFloat = 160,
                memberViewHeight:CGFloat = 190,
                pictureWidth:CGFloat = 115,
                pictureHeight:CGFloat = 145
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        //Setup scrollView:
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: CGFloat(asbMembers.getMembers().count) * (memberViewWidth + 10) + 10, height: memberViewHeight + 10)
        
        //Add a new asb member for each one that exists:
        for (index, member) in asbMembers.getMembers().enumerated() {
            print("[\(utils.getTime())] Adding new view for \(member.getName())")
            scrollView.addSubview(createASBMember(member: member, index: index))
        }
        scrollView.frame.size.width = view.frame.size.width
        
        let globalTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        
        //Shop:
        shopView.layer.borderColor = greenColor?.cgColor
        shopView.layer.borderWidth = 3
        shopView.layer.cornerRadius = 6
        shopView.addGestureRecognizer(globalTap)
        shopView.tag = 0
        
        //Announcements:
        announcementsView.layer.borderColor = greenColor?.cgColor
        announcementsView.layer.borderWidth = 3
        announcementsView.layer.cornerRadius = 6
        announcementsView.addGestureRecognizer(globalTap)
        announcementsView.tag = 1
    }
    
    func viewTapped(tap: UITapGestureRecognizer) {
        let tag = tap.view?.tag
        if tag == 0 { // Shop view
            
        } else if tag == 1 { // Announcements
            
        }
    }
    
    func createASBMember(member: ASBMember, index: Int) -> UIView {
        
        //View:
        let memberView = UIView()
        memberView.backgroundColor = goldColor
        memberView.frame.size = CGSize(width: memberViewWidth, height: memberViewHeight)
        memberView.frame.origin = CGPoint(x: CGFloat(index) * (memberViewWidth + 10) + 10, y: scrollView.center.y - (memberViewHeight / 2) - 25)
        memberView.layer.borderColor = goldColor?.cgColor
        memberView.layer.cornerRadius =  6
        memberView.layer.borderWidth = 2
        memberView.clipsToBounds = true
        
        let name:UILabel = UILabel(),
        job:UILabel = UILabel()
        //Name:
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.text = member.getName()
        name.sizeToFit()
        name.textColor = greenColor
        name.frame.origin = CGPoint(x: CGFloat(memberViewWidth / 2) - (name.frame.width / 2), y: memberViewHeight - 33)
        
        //Job:
        job.font = UIFont(name: "Arial", size: 12)
        job.text = member.getJob()
        job.sizeToFit()
        job.textColor = greenColor
        job.frame.origin = CGPoint(x: CGFloat(memberViewWidth / 2) - (job.frame.width / 2), y: memberViewHeight - 17)
        
        //Image:
        let image:UIImageView = UIImageView(image: member.getImage())
        image.frame.size = CGSize(width: pictureWidth, height: pictureHeight)
        image.frame.origin = CGPoint(x: (memberViewWidth / 2) - (image.bounds.width / 2), y: 10)
        image.layer.borderColor = goldColor?.cgColor
        image.layer.borderWidth = 2
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        
        //Add to view:
        memberView.addSubview(image)
        memberView.addSubview(name)
        memberView.addSubview(job)
        
        return memberView
    }
}
