//
//  SignInPage.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 24/8/21.
//

import UIKit

class SignInPage: UIViewController {
	@IBOutlet var email: UITextField!
	@IBOutlet var password: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		//Create the bottom line
		let bottomLine = CALayer()
		
		//Underline for email
		bottomLine.frame = CGRect(x: 0, y: email.frame.height - 2, width: email.frame.width, height: 2)
		bottomLine.backgroundColor = UIColor.init(red: 82/255, green: 67/255, blue: 255/255, alpha: 1).cgColor
		
		//Removing border on text field
		email.borderStyle = .none
		
		//Adding the line to the text field
		email.layer.addSublayer(bottomLine)
		
		
		//Underline for password
		bottomLine.frame = CGRect(x: 0, y: password.frame.height - 2, width: password.frame.width, height: 2)
		bottomLine.backgroundColor = UIColor.init(red: 82/255, green: 67/255, blue: 255/255, alpha: 1).cgColor
		
		//Removing border on text field
		password.borderStyle = .none
		
		//Adding the line to the text field
		password.layer.addSublayer(bottomLine)
    }
	
	
	
	
}
