//
//  personPage.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 24/8/21.
//

import UIKit
import Firebase

class personPage: UIViewController {

    @IBOutlet weak var UserGender: UITextField!
    @IBOutlet weak var UserAge: UITextField!
    @IBOutlet weak var UserHight: UITextField!
    @IBOutlet weak var UserWeight: UITextField!
    @IBOutlet weak var FirstNamee: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetData()
        
    }
    
    func GetData(){
        let db = Firestore.firestore()
        let userID = Auth.auth().currentUser?.uid
        db.collection("Users").whereField("uid", isEqualTo: userID!).getDocuments{(snap, err) in
            if err != nil{
                print(err?.localizedDescription)
                return
            }
            for i in snap!.documents{
                if i.documentID == Auth.auth().currentUser!.uid{
                    let age = i.get("Age") as! String
                    let email = i.get("Email") as! String
                    let FirstName = i.get("FirstName") as! String
                    let Gender = i.get("Gender") as! String
                    let height = i.get("Height") as! String
                    let lastName = i.get("LastName") as! String
                  
                    let weight = i.get("Weight") as! String
                    DispatchQueue.main.async {
                        self.FirstNamee.text = "Hi, " + FirstName
                        self.UserGender.text = "Gender: " + Gender
                        self.UserAge.text = "Age: " + age
                        self.UserHight.text = "Hight: " + height
                        self.UserWeight.text = "Weight: " + weight
                    }
                }
            }
        }
    }
    

 
}
