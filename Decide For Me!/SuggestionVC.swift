//
//  SuggestionVC.swift
//  Decide For Me!
//
//  Created by Zizheng Cheng on 4/27/18.
//  Copyright © 2018 Lifely. All rights reserved.
//

//  TITOR IS WORKING ON THIS ONE

import UIKit

class SuggestionVC: UIViewController
{
    @IBOutlet weak var nameLabel: UILabel!
    var lat = "0.0"
    var long = "0.0"
    
    @IBOutlet weak var restaurantImage: UIImageView!
    
    override func viewDidLoad()
    {
        //entry point, called when this VC is brought up
        super.viewDidLoad()
        //leave that ^
        //write your code beneath
        
        
    }
    
    
    @IBAction func findRestaurant(_ sender: Any) {
        print(lat)
        print(long)
        let finder = RestaurantFinder(Latitude: lat, Longitude: long)
        finder.getOne(completion: {restaurant in
            restaurant.fetchImage(completion: {image in
                DispatchQueue.main.async {
                    self.restaurantImage.image = image
                    print(restaurant.name)
                    self.nameLabel.text = restaurant.name
                }
            })
            
        })
        
    }
}
