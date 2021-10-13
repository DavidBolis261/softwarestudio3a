//
//  SocialLeaderboardUIViewViewController.swift
//  SoftwareStudio3
//
//  Created by Tanzeem Syeda on 14/9/21.
//

import UIKit
import Firebase

class LeaderboardUIViewViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    struct ListItem {
        var name: String
        var caloriesBurnt: Double
        
        init(name: String, caloriesBurnt: Double) {
            self.name = name
            self.caloriesBurnt = caloriesBurnt
        }
    }
    
    var data: [ListItem] = []
    
    @IBOutlet var table: UITableView!

    @IBOutlet weak var Box1: UIButton!
    
    @IBOutlet weak var Box2: UIButton!
    
    @IBOutlet weak var Box3: UIButton!
    
    
    @IBOutlet weak var Box4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        Box1.layer.cornerRadius = 7
//        Box2.layer.cornerRadius = 7
//        Box3.layer.cornerRadius = 7
        Box4.layer.cornerRadius = 7
        
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        db.collection("Users").order(by: "CaloriesBurnt", descending: true).limit(to: 20).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    let firstName = document.get("FirstName") as! String
                    let lastName = document.get("LastName") as! String
                    
                    let name = firstName + " " + lastName
                    let calories = document.get("CaloriesBurnt") as! Double
                    
                    self.data.append(ListItem(name: name, caloriesBurnt: calories))
                }
                
                self.table.reloadData()
            }
        }
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

extension LeaderboardUIViewViewController: UITableViewDataSource, UITableViewDelegate {
    
    static let leaderboardListCellIdentifier = "LeaderboardListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.leaderboardListCellIdentifier, for: indexPath) as? LeaderboardListCell else {
            fatalError("Unable to deque LeaderboardListCell")
        }
        
        let user = data[indexPath.row]
        
        cell.nameLabel.text = user.name
        cell.caloriesLabel.text = user.caloriesBurnt.description
        
        return cell
    }
}
