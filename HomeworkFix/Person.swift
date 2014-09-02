//
//  Person.swift
//  HomeworkFix
//
//  Created by Nathan Ma on 8/23/14.
//  Copyright (c) 2014 Nathan. All rights reserved.
//

import UIKit


class Person : NSObject, NSCoding {
    
    var firstName : String
    var lastName : String
    var image : UIImage?
    var gitHubUserName : String?
    


    
        required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
            if let myImage = aDecoder.decodeObjectForKey("image") as? UIImage {
                self.image = myImage
            }
            
            
//        self.image = aDecoder.decodeObjectForKey("image") as? UIImage
        super.init()
        
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        if self.image != nil{
            aCoder.encodeObject(self.image!, forKey: "image")
        }
        if self.gitHubUserName != nil {
            aCoder.encodeObject(self.gitHubUserName!, forKey: "gitHubUserName")
        }
        
    }
    
        init (fName : String, lName : String) {
        self.firstName = fName
        self.lastName = lName
    }
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
}
