//
//  WorkOutSelection.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 1/9/21.
//

import UIKit

class WorkOutSelection: UIViewController {
    var IntialInformation = ""
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
        let vc = storyboard?.instantiateInitialViewController(identifier: "workoutsecondview") as! WorkOutPage
        vc.modalPresentationStyle = .fullscreen
        present(vc, animate: false)
        vc.Information = "\(TextFieldOne.text!)"
    }
    
    @IBAction func pushupsActionBtn(_ sender: Any) {
        let vc = storyboard?.instantiateInitialViewController(identifier: "workoutsecondview") as! WorkOutPage
        vc.modalPresentationStyle = .fullscreen
        present(vc, animate: false)
    }
    
    @IBAction func crunchesActionBtn(_ sender: Any) {
        let vc = storyboard?.instantiateInitialViewController(identifier: "workoutsecondview") as! WorkOutPage
        vc.modalPresentationStyle = .fullscreen
        present(vc, animate: false)
    }
    
    @IBAction func pullupsActionBtn(_ sender: Any) {
        let vc = storyboard?.instantiateInitialViewController(identifier: "workoutsecondview") as! WorkOutPage
        vc.modalPresentationStyle = .fullscreen
        present(vc, animate: false)
    }
    
}
