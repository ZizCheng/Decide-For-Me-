//
//  SuggestionVC.swift
//  Decide For Me!
//
//  Created by Zizheng Cheng on 4/22/18.
//  Copyright © 2018 Lifely. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftyButton

class ChoiceVC: UIViewController
{
    @IBOutlet weak var SuggestionVCButton: PressableButton!
    @IBOutlet weak var TinderVCButton: PressableButton!
    var lat = "0.0"
    var long = "0.0"

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        SuggestionVCButton.cornerRadius = 5
        TinderVCButton.cornerRadius = 5
        SuggestionVCButton.shadowHeight = 5
        TinderVCButton.shadowHeight = 5
        print("we made it boys")
    }
    @IBAction func SuggestionVCClick(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SVC") as! SuggestionVC
        vc.lat = lat
        vc.long = long
        self.present(vc, animated: false, completion: nil)
    }
    @IBAction func TinderVCClick(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TVC") as! TinderVC
        self.present(vc, animated: false, completion: nil)
    }
    
}
