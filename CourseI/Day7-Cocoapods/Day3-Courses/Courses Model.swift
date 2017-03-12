//: Playground - noun: a place where people can play

import Foundation

private let json = NSURL(string: "https://raw.githubusercontent.com/ilyannn/iOS-Swift-Materials/master/CourseI/courses-v4.json")

class IncorrectURLError: ErrorType {
    
}

private func jsonFrom(maybe_url: NSURL?) throws -> AnyObject  {
 
    guard let url = maybe_url else { throw IncorrectURLError() }
    let data = try NSData(contentsOfURL: url, options: [])
    return try NSJSONSerialization.JSONObjectWithData(data, options: [])
}

// https://developer.apple.com/library/ios/qa/qa1480/_index.html

class JSONIncomingDateFormatter : NSDateFormatter {
    
    override init() {
        
        super.init()
        
        locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormat = "dd-MM-yy"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class Course {

    private static let jsonIncomingFormatter = JSONIncomingDateFormatter()

    let courseName: String
    let teacherName: String
    let logoURL: NSURL?
    let startDate: NSDate?
    
    private init(_ dict: [String: String]) {
        courseName = dict["name"] ?? "<unknown name>"
        teacherName = dict["teacher"] ?? ""
        logoURL = NSURL(string: dict["logo"] ?? "")

        let startDateString = dict["starts"] ?? ""
        startDate = Course.jsonIncomingFormatter.dateFromString(startDateString)
    }

    private convenience init?(_ dict: AnyObject) {
        
        guard let strings_strings = dict as? [String: String] else {
            return nil
        }

        self.init(strings_strings)
    }
}

func getCourses() -> [Course] {
    
    let maybe_json = try? jsonFrom(json)
    
    guard let json_array = maybe_json as? [AnyObject] else {
        return []
    }
    
    return json_array.flatMap(Course.init)
}

