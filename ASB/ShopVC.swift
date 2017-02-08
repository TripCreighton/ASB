//
//  ShopVC.swift
//  ASB
//
//  Created by Trip Creighton on 2/7/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import UIKit
import WebKit

class ShopVC: UIViewController {

    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setup() {
//        self.webView.frame = self.frame
        self.view.addSubview(webView)
    }
}
