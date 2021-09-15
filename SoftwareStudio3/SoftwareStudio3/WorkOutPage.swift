//
//  WorkOutPage.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 15/9/21.
//

import UIKit

class WorkOutPage: UIViewController {
    var Information = ""
    @IBOutlet weak var workoutTypeOut: UILabel!
    @IBOutlet weak var workoutImageOut: UIImageView!
    @IBOutlet weak var caloriesNumOut: UILabel!
    @IBOutlet weak var calculatedTime: UILabel!
    @IBOutlet weak var excerciseQTYOut: UILabel!
    @IBOutlet weak var ActivityBtnOutlet: UIButton!
    
   
    @IBOutlet weak var theinsightViewOut: UIView!
    @IBOutlet weak var GrayedWallOut: UIView!
    var activityStarted  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ActivityBtnOutlet.layer.cornerRadius = 7
        theinsightViewOut.layer.cornerRadius = 7
    }
    
    @IBAction func activityBtnAction(_ sender: Any) {
        activityStarted.toggle()
        
        
        if activityStarted{
            GrayedWallOut.isHidden = true
            ActivityBtnOutlet.setTitle("Stop Now", for: .normal)
            ActivityBtnOutlet.backgroundColor = UIColor.red
        }
        if activityStarted == false{
            GrayedWallOut.isHidden = false
            ActivityBtnOutlet.setTitle("Start Now", for: .normal)
        }
    }
    


}
