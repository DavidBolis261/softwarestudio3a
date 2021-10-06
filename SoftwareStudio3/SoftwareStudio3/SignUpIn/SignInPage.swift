//
//  SignInPage.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 24/8/21.
//

import UIKit
import Firebase 

class SignInPage: UIViewController, UITextFieldDelegate {
	@IBOutlet var email: UITextField!
	@IBOutlet var password: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		email.delegate = self
		password.delegate = self
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
	
	
	func signIn(Email: String, Password: String){
		Auth.auth().signIn(withEmail: Email, password: Password) {(res, err) in
			if err != nil{
				
				print(err!.localizedDescription)
			} else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "mainPage")
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated:true)
				
			}
		}
	}
    
    @IBAction func signInButtonAction(_ sender: Any) {
        signIn(Email: email.text!, Password: password.text!)
    }
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		email.resignFirstResponder()
		return password.resignFirstResponder()
	}
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
}
