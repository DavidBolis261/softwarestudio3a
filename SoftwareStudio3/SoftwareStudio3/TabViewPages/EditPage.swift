//
//  EditPage.swift
//  SoftwareStudio3
//
//  Created by David Bolis on 7/10/21.
//

import UIKit
import Firebase

class EditPage: UIViewController {

    @IBOutlet weak var titleText: UITextView!
    @IBOutlet weak var weightText: UILabel!
    @IBOutlet weak var heightText: UILabel!
    
    @IBOutlet weak var ageText: UILabel!
    
    @IBOutlet weak var MaleBtnOut: UIButton!
    
    @IBOutlet weak var otherBtnOut: UIButton!
    @IBOutlet weak var femaleBtnOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        MaleBtnOut.layer.cornerRadius = 7
        femaleBtnOut.layer.cornerRadius = 7
        otherBtnOut.layer.cornerRadius = 7
        GetData()
    }
    
    @IBAction func sliderAction(_ sender: Any) {
    }
    
    @IBAction func sliderWeightAction(_ sender: Any) {
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
                        self.titleText.text = "\(FirstName) \(lastName)"
                        
                    }
                }
            }
        }
    }
}
