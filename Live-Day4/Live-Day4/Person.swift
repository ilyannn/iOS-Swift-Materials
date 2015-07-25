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
    let badges: [String] = ["iOS", "Swift"]
    let image: UIImage? = nil
    
    init(name: String) {
        self.name = name
    }
}


