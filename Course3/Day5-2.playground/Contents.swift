//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

UIImage(named: "person")

if let url = NSBundle.mainBundle().URLForResource("service1", withExtension: "json") {

    if let data = NSData(contentsOfURL: url) {
        
        let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
        json
    }
}

