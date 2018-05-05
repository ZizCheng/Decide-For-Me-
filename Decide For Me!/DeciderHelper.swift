//
//  DeciderHelper.swift
//  Decide For Me!
//
//  Created by Zizheng Cheng on 5/4/18.
//  Copyright © 2018 Lifely. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation
import SwiftyButton

class DeciderHelper
{
    private let resFinder: RestaurantFinder
    private var restaurants: [Restaurant]?
    private var Preference: [(Restaurant, String)]
    
    init(_ resFinder: RestaurantFinder)
    {
        self.resFinder = resFinder
        self.restaurants = resFinder.getMany()
        self.Preference = []
    }
    
    func liked(index: Int)
    {
        self.Preference.append((restaurants![index], "liked"))
    }
    
    func dislike(index: Int)
    {
        self.Preference.append((restaurants![index], "disliked"))
    }
    
    func getLikes() -> [Restaurant] {
        let likes = Preference
            .filter({
                $0.1 == "liked"
            })
            .map({ $0.0 })
        return likes
    }
    
    func getDislikes() -> [Restaurant] {
        let dislikes = Preference
            .filter({
                $0.1 == "disliked"
            })
            .map({ $0.0 })
        return dislikes
    }

}
