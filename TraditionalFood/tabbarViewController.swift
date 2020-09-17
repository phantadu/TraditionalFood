//
//  tabbarViewController.swift
//  TraditionalFood
//
//  Created by phan tá dự on 7/27/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit

class tabbarViewController: UITabBarController , UITabBarControllerDelegate {
    var trangchuviewcontroller : TrangChuViewController!
    var yeuthichviewcontroller : YeuThichViewController!
    var ttmonancontroller : TTMonAnViewController!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        trangchuviewcontroller = TrangChuViewController()
        yeuthichviewcontroller = YeuThichViewController()
        ttmonancontroller = TTMonAnViewController()
        trangchuviewcontroller.tabBarItem.image = UIImage(named: "home")
        trangchuviewcontroller.tabBarItem.selectedImage = UIImage(named: "home-selected")
        yeuthichviewcontroller.tabBarItem.image = UIImage(named: "yeuthich")
        yeuthichviewcontroller.tabBarItem.selectedImage = UIImage(named: "yeuthich-selected" )
        ttmonancontroller.tabBarItem.image = UIImage(named: "Lichsu")
        ttmonancontroller.tabBarItem.selectedImage = UIImage(named: "lichsu-selected")
        viewControllers = [trangchuviewcontroller,yeuthichviewcontroller,ttmonancontroller]
        
    }

      
   

}
   
    

