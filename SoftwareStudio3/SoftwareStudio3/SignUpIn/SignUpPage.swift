//
//  SignUpPage.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 24/8/21.
//

import UIKit

class SignUpPage: UIViewController {

	@IBOutlet var fullname: UITextField!
	@IBOutlet var email: UITextField!
	@IBOutlet var password: UITextField!
	@IBOutlet var age: UITextField!
	@IBOutlet var weight: UITextField!
	@IBOutlet var height: UITextField!
	
	@IBOutlet var signupButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	
	
	//
//	@IBAction func signupTapped(_ sender: Any) {
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		let vc = storyboard.instantiateViewController(withIdentifier: "homePage")
//		vc.modalPresentationStyle = .overFullScreen
//		present(vc, animated: true)
//	}

}

//extension SignUpPage : UITextFieldDelegate {
//	func textField.resignFirstResponder()

