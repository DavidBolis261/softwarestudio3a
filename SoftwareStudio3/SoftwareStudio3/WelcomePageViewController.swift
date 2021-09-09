//
//  WelcomePageViewController.swift
//  SoftwareStudio3
//
//  Created by Amaan Ansari on 8/9/21.
//

import UIKit

class WelcomePageViewController: UIViewController {

    
    @IBOutlet weak var getStartedOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        getStartedOutlet.layer.cornerRadius = 7
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
