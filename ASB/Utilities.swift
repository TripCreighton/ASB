//
//  Utilties.swift
//  ASB
//
//  Created by Trip Creighton on 1/9/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    private let _timeComponents = Date(),
                _timeFormatter = DateFormatter()
    
    func getDate() -> String {
        _timeFormatter.dateFormat = "dd.MM.yyyy"
        return _timeFormatter.string(from: _timeComponents)
    }
    
    func getTime() -> String {
        _timeFormatter.dateFormat = "HH:mm:ss"
        return _timeFormatter.string(from: _timeComponents)
    }
}

extension String {
    
    var count:Int {
        return self.characters.count
    }
    
    func array() -> [Character] {
        var arr:[Character]! = []
        for char in self.characters {
            arr.append(char)
        }
        return arr
    }
    
    func at(_ pos: Int) -> Character? {
        if self.characters.count < pos {
            return nil
        }
        return self.array()[pos]
    }
    
    func substring(from: Int, to: Int) -> String? {
        if from < 0 || to > self.count {
            return nil
        }
        var temp:String = ""
        for i in from...to {
            temp.append(self.array()[i])
        }
        return temp
    }
    
    func base64Encode() -> String {
        return (self.data(using: String.Encoding.utf8)?.base64EncodedString())!
    }
    
    func base64Decode() -> String {
        return String(data: Data(base64Encoded: self)!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    }
}


extension UIWebView {
    func parseAndLoad(_ query: String) {
        if !(query.contains("http://") || query.contains("https://") || query.contains("http://www.") || query.contains("https://www.")) {
            self.loadRequest(URLRequest(url: URL(string: "https://www.google.com/?q=\(query.replacingOccurrences(of: " ", with: "+"))")!))
        } else {
            self.loadRequest(URLRequest(url: URL(string: query)!))
        }
    }
}

extension UIColor {
    convenience init?(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a/255)
    }
    
    var colorComponents: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let comp = CIColor(color: self)
        return (comp.red, comp.green, comp.blue, comp.alpha)
    }
    
    var r:CGFloat {
        return colorComponents.r
    }
    
    var g:CGFloat {
        return colorComponents.g
    }
    
    var b:CGFloat {
        return colorComponents.b
    }
    
    var a:CGFloat {
        return colorComponents.a
    }
}

extension Character {
    func toAscii() -> UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}

extension UIView {
    func circularize(xy: CGPoint, wh: CGSize, borderSize: Int) {
        self.frame = CGRect(x: xy.x, y: xy.y, width: wh.width, height: wh.height)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 8
        self.layer.cornerRadius = self.frame.width / 2
    }
}

