//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

UIImage(named: "person")

class Trip {
    
}


func read(dict: [String: AnyObject]) -> Trip {
    
}

func parse(urlString: String) -> [Trip] {
    
    guard let url = NSURL(string: urlString),
        let data = NSData(contentsOfURL: url) else {
            return []
    }
    
    guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: []) else {
        return []
    }
    
    guard let array = json as? [ [String:AnyObject] ] else {
        return []
    }
    
    return array.map(read)
}

parse("https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/Course3/Day5-2.playground/Resources/service1.json")
