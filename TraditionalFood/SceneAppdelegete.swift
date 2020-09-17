//
//  SceneAppdelegete.swift
//  TraditionalFood
//
//  Created by phan tá dự on 7/27/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit

class SceneAppdelegete :  UIResponder, UIWindowSceneDelegate {
var window: UIWindow?


func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let trangchuviewcontroller = TrangChuViewController()
    let trangchuNavi = UINavigationController(rootViewController: trangchuviewcontroller)
    trangchuNavi.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "house.fill" ) , selectedImage: UIImage (named: "house.fill-selected"))
      
    let yeuthichcontroller = YeuThichViewController()
    let yeuthichNavi = UINavigationController(rootViewController: yeuthichcontroller )
    yeuthichNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
     let ttmonancontroller = TTMonAnViewController()
    let ttmonanNavi = UINavigationController(rootViewController: ttmonancontroller)
    ttmonanNavi.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
    let tabbarController = UITabBarController()
           tabbarController.delegate = self
    tabbarController.viewControllers = [trangchuNavi , yeuthichNavi , ttmonanNavi]

  window.rootViewController = tabbarController
        
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}


extension SceneAppdelegete : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Tab : \(tabBarController.selectedIndex)")
    }
}
