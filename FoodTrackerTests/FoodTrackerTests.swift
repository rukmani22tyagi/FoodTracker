//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Rukmani on 28/07/16.
//  Copyright © 2016 Rukmani. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitialization() {
        // Success case.
        let potentialItem = Meal(name: "Newest meal", rating: 5, photo: nil)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Meal(name: "",rating: 0, photo: nil)
        XCTAssertNil(noName, "Empty name is invalid")
        
       let badRating = Meal(name: "Really bad rating", rating: -1, photo: nil)
        XCTAssertNil(badRating, " Negative ratings are not allowed")
    }
    
    
    
}
