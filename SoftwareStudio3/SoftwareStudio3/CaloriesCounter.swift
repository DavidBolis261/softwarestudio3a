//
//  CaloriesCounter.swift
//  SoftwareStudio3
//
//  Created by Tanzeem Syeda on 7/10/21.
//

import UIKit
import FirebaseFirestore


class CaloriesInputViewController: UIViewController{
    
    let db = Firestore.firestore()
    
    @IBOutlet var foodlabel: UILabel!
    @IBOutlet var foodfield: UITextField!
    @IBOutlet var calorieslabel: UILabel!
    @IBOutlet var caloriesfield: UITextField!
    
    override func viewDidLoad() {
        viewDidLoad()
        let docRef = db.document("caloriescounter/calories")
        docRef.getDocument{snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            print(data)
        }
    }
    
    func textFieldShouldReturn( foodfield: UITextField) -> Bool {
        if let text = foodfield.text, !text.isEmpty {
            saveData(text: text)
        }
        return true
    }
    
    func saveData(text:String){
        let docRef = db.document("calories/caloriescounter")
        docRef.setData(["text":text])
    }

}

