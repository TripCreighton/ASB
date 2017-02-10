//
//  ASBMembers.swift
//  ASB
//
//  Created by Trip Creighton on 1/10/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import Foundation
import UIKit

/*
    Adding a new asb member in the init function by calling 'createNewMember'. Each member will automatically have their own view added automatically via some special dynamic code in MainVC.swift
 */

class ASBMembers {
    //Variables:
    private var memberArray:[ASBMember]! = []
    
    //Constants:
    private let utils:Utilities = Utilities()
    
    //Create ASB members here:   
    init() {
        createNewMember(name: "a", job: "Test", image: UIImage(named: "FruitBowl"))
        createNewMember(name: "b", job: "Test", image: #imageLiteral(resourceName: "FruitBowl"))
        createNewMember(name: "c", job: "Test", image: #imageLiteral(resourceName: "FruitBowl"))
        createNewMember(name: "d", job: "Test", image: #imageLiteral(resourceName: "FruitBowl"))
        createNewMember(name: "e", job: "Test", image: #imageLiteral(resourceName: "FruitBowl"))
        createNewMember(name: "f", job: "Test", image: #imageLiteral(resourceName: "FruitBowl"))
        validate()
    }
    
    //Add a new staff member by calling this function:
    func createNewMember(name: String!, job: String!, image: UIImage!) {
        memberArray.append(ASBMember(name: name, job: job, image: image))
    }
    
    //Returns the array of all members
    func getMembers() -> [ASBMember] {
        return memberArray
    }
    
    //Returns a member by their name
    func getMember(byName: String!) -> ASBMember {
        for member in memberArray {
            if member.getName() == byName {
                return member
            }
        }
        return ASBMember()
    }

    //Returns a member by their job
    func getMember(byJob: String!) -> ASBMember {
        for member in memberArray {
            if member.getJob() == byJob {
                return member
            }
        }
        return ASBMember()
    }
    
    //Validate before sending anything back:
    func validate() {
        if memberArray.count == 0 {
            print("[\(utils.getTime())] No ASB members were added!")
        }
    }
}

class ASBMember {
    
    private var name:String!,
    job:String!,
    image:UIImage!
    
    init(name: String!, job: String!, image: UIImage!){
        if(name == "" || job == ""){
            print("[\(Utilities().getTime())] Failed to initalize a Member!")
            return
        }
        self.name = name
        self.job = job
        self.image = image
    }
    
    init() {
        
    }
    
    func getName() -> String {
        return name
    }
    
    func getJob() -> String {
        return job
    }
    
    func getImage() -> UIImage {
        return image
    }
    
    func toString() -> String {
        return "Name: \(name) Job: \(job) Image Reference: \(image)"
    }
}
