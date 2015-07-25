//
//  Person.swift
//  Live-Day4
//
//  Created by iOS Swift Course on 7/25/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

class Person {
    let name: String
    let badges: [String]
    let image: UIImage?
    
    init(name: String) {
        self.name = name
        self.badges = ["iOS", "Swift"]
        self.image = nil
    }
    
    init(dict:NSDictionary) {
        guard let name = dict["name"] as? String else {
            fatalError("Incorrect key: name")
        }
        guard let badges = dict["badge"] as? [String] else {
            fatalError("Incorrect key: badge")
        }
        
        self.name = name
        self.badges = badges
        
        guard let string = dict["avatar"] as? String else {
            fatalError("Incorrect key: avatar")
        }
        
        guard let good_url = NSURL(string: string) else {
            fatalError("URL format is wrong")
        }
        
        let data = NSData(contentsOfURL: good_url)!
        
        self.image = UIImage(data: data)
    }
}

func MakePerson(something: AnyObject) -> Person? {
    guard let dict = something as? NSDictionary else {return nil}
    return Person(dict: dict)
}

func LoadPersons(from string: String) -> [Person]  {
    guard let good_url = NSURL(string: string) else { return [] }
    guard let data = NSData(contentsOfURL: good_url) else { return [] }
    
    do {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
        
        guard let array = json as? NSArray else { return [] }
        
        return array.flatMap(MakePerson)
    }
    catch {
        return []
    }
}

