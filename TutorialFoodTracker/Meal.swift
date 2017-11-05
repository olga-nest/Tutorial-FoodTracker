//
//  Meal.swift
//  TutorialFoodTracker
//
//  Created by Olga on 11/4/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

import UIKit

class Meal {
    
    var name: String
    var photo : UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
      //The name must not be empty
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
