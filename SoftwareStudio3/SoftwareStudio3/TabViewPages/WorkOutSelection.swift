//
//  WorkOutSelection.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 1/9/21.
//

import UIKit

class WorkOutSelection: UIViewController {

    @IBOutlet weak var runningOutlet: UIButton!
    @IBOutlet weak var pushupOutlet: UIButton!
    @IBOutlet weak var pullUpsOutlet: UIButton!
    @IBOutlet weak var crunchesOutlet: UIButton!
    @IBOutlet weak var mostRecentworkout: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runningOutlet.layer.cornerRadius = 7
        pushupOutlet.layer.cornerRadius = 7
        pullUpsOutlet.layer.cornerRadius = 7
        crunchesOutlet.layer.cornerRadius = 7
        mostRecentworkout.layer.cornerRadius = 7
    }
    
    @IBAction func RunningActionBtn(_ sender: Any) {
        MoveMent(workout: "Running", imageDispay: "Group 1")
    }
    
    @IBAction func pushupsActionBtn(_ sender: Any) {
        MoveMent(workout: "Pushups", imageDispay: "pushup")
    }
    
    @IBAction func crunchesActionBtn(_ sender: Any) {
        MoveMent(workout: "Crunches", imageDispay: "Group 3")
    }
    @IBAction func pullupsActionBtn(_ sender: Any) {
        MoveMent(workout: "PullUps", imageDispay: "Group 2")
    }
    
    func MoveMent(workout: String, imageDispay: String){
        let vc = storyboard?.instantiateViewController(identifier: "workoutpager") as! WorkOutPage
        vc.modalPresentationStyle = .formSheet
        vc.workoutTypeStr = workout
        vc.imagetoDisplaystr = imageDispay
        present(vc, animated: false)
    }
    
}
