//
//  StartViewController.swift
//  TraditionalFood
//
//  Created by phan tá dự on 8/23/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit
import FirebaseAuth
class StartViewController: UIViewController {
    @IBOutlet weak var immmage : UIImage!
    @IBOutlet weak var tradition : UILabel!
    @IBAction func login (_ sender : UIButton) {
        let vd = LoginViewController()
        self.navigationController?.pushViewController(vd, animated: true)
    }
    @IBAction func signup(_ sender : UIButton) {
        let ve = SignUpViewController()
        self.navigationController?.pushViewController(ve, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}


  

