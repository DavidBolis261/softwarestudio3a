//
//  SocialLeaderboardUIViewViewController.swift
//  SoftwareStudio3
//
//  Created by Tanzeem Syeda on 14/9/21.
//

import UIKit

class SocialLeaderboardUIViewViewController: UIViewController {

    @IBOutlet weak var Box1: UIButton!
    
    @IBOutlet weak var Box2: UIButton!
    
    @IBOutlet weak var Box3: UIButton!
    
    
    @IBOutlet weak var Box4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Box1.layer.cornerRadius = 7
        Box2.layer.cornerRadius = 7
        Box3.layer.cornerRadius = 7
        Box4.layer.cornerRadius = 7
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
