//
//  Restaurant.swift
//  RestaurantTable
//
//  Created by Lin Li on 13/02/17.
//  Copyright © 2017 Lin. All rights reserved.
//

import UIKit

class Restaurant {
    var name: String
    var cuisine: String
    var description: String
    var photo: UIImage?
    
    init?(name: String,photo:UIImage?, cuisine: String, description: String) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.cuisine = cuisine
        self.description = description
        self.photo = photo
        
    }
}
