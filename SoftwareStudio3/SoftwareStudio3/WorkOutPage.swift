//
//  WorkOutPage.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 15/9/21.
//

import UIKit
import Foundation
import CoreMotion

class WorkOutPage: UIViewController {
    var workoutTypeStr = ""
    var imagetoDisplaystr = ""
    var OurTimer = Timer()
    var TimerDisplayed = 3
    var Reps = 0
    @IBOutlet weak var CounterText: UILabel!
    @IBOutlet weak var workoutTypeOut: UILabel!
    @IBOutlet weak var workoutImageOut: UIImageView!
    @IBOutlet weak var caloriesNumOut: UILabel!
    @IBOutlet weak var calculatedTime: UILabel!
    @IBOutlet weak var excerciseQTYOut: UILabel!
    @IBOutlet weak var ActivityBtnOutlet: UIButton!
    @IBOutlet weak var theinsightViewOut: UIView!
    @IBOutlet weak var GrayedWallOut: UIView!
    var motion = CMMotionManager()
    
    @IBOutlet weak var numberOfReps: UILabel!
    var activityStarted  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ActivityBtnOutlet.layer.cornerRadius = 7
        theinsightViewOut.layer.cornerRadius = 7
        workoutTypeOut.text = workoutTypeStr
        workoutImageOut.image = UIImage(named: imagetoDisplaystr)
    }
    
    @IBAction func activityBtnAction(_ sender: Any) {
       
        OurTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerDown), userInfo: nil, repeats: true)
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
    
    @objc func TimerDown(){
        TimerDisplayed -= 1
        if (TimerDisplayed == 0){
            CounterText.text = "GO!"
            GrayedWallOut.isHidden = true
            CounterText.isHidden = true
            OurTimer.invalidate()
            myAccel()
            
        } else {
            CounterText.text = "\(TimerDisplayed)"
        }
    }
    func MyGyro(){
        motion.gyroUpdateInterval = 0.1
        motion.startGyroUpdates(to: OperationQueue.current!){(data, error) in
            if let trueData = data{
                print(trueData)
            }
        }
    }
    func myAccel(){
        motion.gyroUpdateInterval = 0.1
        motion.startAccelerometerUpdates(to: OperationQueue.current!){(data, error) in
            if let trueData = data{
                var accelX = trueData.acceleration.x
                var accelY = trueData.acceleration.y
                var accelZ = trueData.acceleration.z
                var Total = accelX + accelY + accelZ
                if (Total > 8){
                    self.Reps += 1
                    print(Total)
                    self.numberOfReps.text = "\(self.Reps)"
                }
            }
        }
    }
}
