//
//  MiniTravelAppTests.swift
//  MiniTravelAppTests
//
//  Created by iOS Swift Course on 12/6/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import XCTest
@testable import MiniTravelApp

class MiniTravelAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTripCreation() {
        let trip = Trip(dict: [ "hit" : 0.9, "segments": ["Alps"]])
        
        XCTAssertEqual(trip.tripSegments, ["Alps"], "Testing segments property")
        XCTAssertEqual(trip.pictureURL, nil, "Testing picture URL property")
    }

    func testTripWithoutSegments() {
        let trip = Trip(dict: [ "hit" : 0.95 ])
        
        XCTAssertEqual(trip.tripSegments, [], "Testing segments property")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
