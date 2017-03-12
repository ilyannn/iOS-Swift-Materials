//
//  Day3_CoursesTests.swift
//  Day3-CoursesTests
//
//  Created by iOS Swift Course on 1/6/16.
//  Copyright © 2016 iOS Swift Course. All rights reserved.
//

import XCTest
@testable import Day3_Courses

class Day3_CoursesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfCourses() {
        let courses = getCourses()
        XCTAssert(courses.count > 3, "Many courses!")
    }
    
    func testDateFormatter() {
        let formatter = JSONIncomingDateFormatter()
        let date = NSDate()
        let str = formatter.stringFromDate(date)
        XCTAssertEqual(str, "09-01-16", "Date format")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            let _ = getCourses()
        }
    }
    
}
