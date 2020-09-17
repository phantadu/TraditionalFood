//
//  DetailViewController.swift
//  TraditionalFood
//
//  Created by phan tá dự on 8/2/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class DetailViewController: UIViewController  {
    var nameFood: String!
    var country: String!
    @IBOutlet weak var namelabel : UILabel!
    var name = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chi tiết"
        name.child("Quốc Gia").child(country).child(nameFood).observe(.value) { (snapshot) in
            let data = snapshot.value as! [String:Any]
            // print(data)
            let huongdansudung = data["Detail"] as! String
            
            // for i in 0...(huongdansudung.count - 1) {
            self.namelabel.text!.append(contentsOf: huongdansudung)
        }
    }
}
