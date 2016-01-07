//: Playground - noun: a place where people can play

import Foundation

private let json = NSURL(string: "https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/CourseI/courses-v1.json")

private func jsonFrom(maybe_url: NSURL?) -> AnyObject {
    
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
    let teacherName: String
    let logoURL: NSURL?
    
    init(_ dict: [String: String]) {
        courseName = dict["name"] ?? "<unknown name>"
        teacherName = dict["teacher"] ?? ""
        logoURL = NSURL(string: dict["logo"] ?? "")
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

