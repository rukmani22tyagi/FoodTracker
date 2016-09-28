//
//  Meal.swift
//  FoodTracker
//
//  Created by Rukmani on 29/07/16.
//  Copyright © 2016 Rukmani. All rights reserved.
//

import Foundation
import UIKit

class Meal: NSObject, NSCoding{
    // Mark : Properties
    
    var name : String
    var photo : UIImage?
    var rating : Int
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    // Mark: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    
    init?(name: String, rating: Int, photo : UIImage?)
    {
        
        self.name = name
        self.rating = rating
        self.photo = photo
        
        super.init()
        
        if (rating<0)||(name.isEmpty)
        {
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }

    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        // Must call designated initializer.
        self.init(name: name, rating: rating, photo: photo)
    }
    
    
}
