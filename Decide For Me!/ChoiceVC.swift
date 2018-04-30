//
//  SuggestionVC.swift
//  Decide For Me!
//
//  Created by Zizheng Cheng on 4/22/18.
//  Copyright © 2018 Lifely. All rights reserved.
//

import UIKit
import CoreLocation

class ChoiceVC: UIViewController
{
    @IBOutlet weak var SuggestionVCButton: UIButton!
    @IBOutlet weak var TinderVCButton: UIButton!
    var lat = "0.0"
    var long = "0.0"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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
