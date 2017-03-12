//: Playground - noun: a place where people can play

import Foundation

let json = NSURL(string: "https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/CourseI/courses-v1.json")

func jsonFrom(maybe_url: NSURL?) -> AnyObject {
    
    guard let url = maybe_url
        else { return "неправильный URL" }
    
    guard let data = NSData(contentsOfURL: url)
        else { return "не получилось скачать" }
    
    guard let json = try? NSJSONSerialization.JSONObjectWithData(data, options: [])
        else { return "неправильный JSON" }
    
    return json
}

class Course {

    let courseName: String
    
    init(_ dict: [String: String]) {
        courseName = dict["name"] ?? "<unknown name>"
    }

    convenience init?(_ dict: AnyObject) {
        
        guard let strings_strings = dict as? [String: String] else {
            return nil
        }

        self.init(strings_strings)
    }
}

func getCourses() -> [Course] {
    
    guard let json_array = jsonFrom(json) as? [AnyObject] else {
        return []
    }
    
    return json_array.flatMap(Course.init)
}



let dict = jsonFrom(json)[0]

dict["logo"]

Course([:])
Course(["name": "Horse-riding"])
Course(dict)
Course(3845)

let courses = (jsonFrom(json) as! [AnyObject]).flatMap(Course.init)

[5, 7, ["name":"имя курса"], 9].flatMap(Course.init)
