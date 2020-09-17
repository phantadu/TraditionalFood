//
//  MenuViewController.swift
//  TraditionalFood
//
//  Created by M_catalina on 7/18/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lable.text = "Khu Vực"
 
    }

    @IBOutlet weak var tableview: UITableView!
    


}
