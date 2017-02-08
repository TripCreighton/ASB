//
//  AnnouncementPreviewTV.swift
//  ASB
//
//  Created by Trip Creighton on 2/7/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import UIKit

class AnnouncementPreviewTV: UITableView, UITableViewDelegate {

    private let greenColor = UIColor(r: 38, g: 57, b: 30, a: 255),
                goldColor = UIColor(r: 155, g: 122, b: 41, a: 255)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tableFooterView = UIView(frame: CGRect.zero)
        self.backgroundColor = goldColor
        print("TABLE INIT")
    }
    
    
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        print("test")
//        return 1
//    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("test")
        return 5
    }
}
