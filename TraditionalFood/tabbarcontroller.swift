//
//  tabbarcontroller.swift
//  TraditionalFood
//
//  Created by phan tá dự on 7/27/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit

class tabbarcontroller: UITabBarController , UITabBarControllerDelegate {
    var trangchuviewcontroller = TrangChuViewController()
    var yeuthichcontroller = YeuThichViewController()
    var settingviewcontroller = SettingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        trangchuviewcontroller = TrangChuViewController()
        trangchuviewcontroller.title = "Trang Chủ"
        yeuthichcontroller = YeuThichViewController()
        yeuthichcontroller.title = "Yêu Thích"
        settingviewcontroller = SettingViewController()
        trangchuviewcontroller.tabBarItem = UITabBarItem(title: "Trang chủ", image: UIImage(named: "Image-3") , tag: 0)
        yeuthichcontroller.tabBarItem = UITabBarItem(title: "Yêu thích", image: UIImage(named: "Image-5") , tag: 0)
        settingviewcontroller.tabBarItem = UITabBarItem(title: "Cài đặt", image: UIImage(named: "Image-4") , tag: 0)
        self.delegate = self
        viewControllers = [trangchuviewcontroller,yeuthichcontroller,settingviewcontroller]
        
    }
}
