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
    var RF: RestaurantFinder
    var resArr = [Restaurant]()
    var good = [Restaurant]()
    var bad = [Restaurant]()
    
    init(RF: RestaurantFinder)
    {
        self.RF = RF
        self.RF.getMany(completion: {ret in
            self.resArr = ret
        })
        good = resArr
    }
    
    func liked(index: Int)
    {
        for r in good {
            if(r.equals(r: resArr[index]))
            {
                return
            }
        }
        
        //this one isn't in the good list yet, proceed
    }

}
