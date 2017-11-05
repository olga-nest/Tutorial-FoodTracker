//
//  TutorialFoodTrackerTests.swift
//  TutorialFoodTrackerTests
//
//  Created by Olga on 11/3/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

import XCTest
@testable import TutorialFoodTracker

class TutorialFoodTrackerTests: XCTestCase {
    
    //MARK: Meal Class Tests
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitializationSucceeds() {
        //Zero rating
        let ZeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(ZeroRatingMeal)
        
        //Highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
    func testMealInitializationFails() {
        //Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        //Empty string
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 1)
        XCTAssertNil(emptyStringMeal)
    }
}
