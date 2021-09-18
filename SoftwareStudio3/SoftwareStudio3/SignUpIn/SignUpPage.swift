//
//  SignUpPage.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 24/8/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpPage: UIViewController {

	@IBOutlet var firstname: UITextField!
	@IBOutlet var lastname: UITextField!
	@IBOutlet var email: UITextField!
	@IBOutlet var password: UITextField!
	@IBOutlet var age: UITextField!
	@IBOutlet var weight: UITextField!
	@IBOutlet var height: UITextField!
	@IBOutlet var gender: UITextField!
	@IBOutlet var errorLabel: UILabel!
	@IBOutlet var signupButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		setUpElements()
    }
	
	func setUpElements() {
		//Hide the error label
		errorLabel.alpha = 0

	}
	
	//password validation
	func isPasswordValid(_ password : String) -> Bool{
		let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,}")
		return passwordTest.evaluate(with: password)
	}
	
	//error message
	func showError(_ message:String) {
		errorLabel.text = message
		errorLabel.alpha = 1
	}
	
	//Check if fields are filled out and all values are correct
	func validateFields() -> String? {
		
		//Check all fields are filled in
		if firstname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			lastname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			age.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			weight.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			height.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
			gender.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
			
			return "Please fill in all fields."
		}
		
		//Check if password is secured
		let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		if isPasswordValid(cleanedPassword) == false {
			return "Please make sure your password is strong."
		}
		
		return nil
	}
	
	@IBAction func signupTapped(_ sender: Any) {
		let error = validateFields()
		
		if error != nil {
			//show error message
			showError(error!)
		}
		
		else {
		signUP()
		
	}
	
	func signUP() {
		
		//Create cleaned version of the data
		let FirstName = firstname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let LastName = lastname.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let EmailAddress = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let Password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let Age = age.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let Height = height.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let Weight = weight.text!.trimmingCharacters(in: .whitespacesAndNewlines)
		let Gender = gender.text!.trimmingCharacters(in: .whitespacesAndNewlines)


		Auth.auth().createUser(withEmail: EmailAddress, password: Password) { (authResult, error) in
			if error != nil {
				self.showError("Error Creating User")
			}
			else {
				let db = Firestore.firestore()

				db.collection("Users").addDocument(data: ["FirstName":FirstName, "LastName":LastName, "Email":EmailAddress, "Password":Password, "Age":Age, "Height":Height, "Weight":Weight, "Gender":Gender, "uid":authResult!.user.uid]) {(error) in
					if error != nil {
						self.showError("Error saving user data")
					}
				}
			}
					let storyboard = UIStoryboard(name: "Main", bundle: nil)
					let vc = storyboard.instantiateViewController(withIdentifier: "homePage")
					vc.modalPresentationStyle = .overFullScreen
					self.present(vc, animated:true)
		}
		
	}
}



}
