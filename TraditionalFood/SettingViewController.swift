//
//  SettingViewController.swift
//  TraditionalFood
//
//  Created by phan tá dự on 8/24/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit
import FirebaseAuth
struct Settings {
    var icons : String?
    var namesetting : String?
}
class SettingViewController: UIViewController {
    @IBOutlet weak var tbview : UITableView!
    var arraysetting : [Settings] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbview.register(UINib(nibName: "SettingTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "Settingtable")
        self.arraysetting.append(Settings(icons: "share", namesetting: "Share App"))
        self.arraysetting.append(Settings(icons: "dark", namesetting: "Dark Mode"))
        self.arraysetting.append(Settings(icons: "logout", namesetting: "Log Out"))
        self.arraysetting.append(Settings(icons: "Change", namesetting: "ChangePassword"))
        
    }
    
}
extension SettingViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraysetting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "Settingtable", for: indexPath) as! SettingTableViewCell
        let items = arraysetting[indexPath.row]
        tablecell.icon.image = UIImage(named: items.icons ?? "")
        tablecell.setting.text = items.namesetting
        return tablecell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch  indexPath.row {
        case 0 :
            let text = "Cài đặt ứng dụng TraditionFood để trở thành 1 đầu bếp tuyệt vời nhé !"
            let url : NSURL = NSURL(string: "https://www.youtube.com/?gl=VN")!
            let image = UIImage(named: "Image")
            
            let activityViewController = UIActivityViewController(activityItems: [text,url,image! ] , applicationActivities: [])
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
            
        case 1 :
            UIApplication.shared.windows.forEach { window in
                if window.overrideUserInterfaceStyle == .dark {
                    window.overrideUserInterfaceStyle = .light
                } else {
                    window.overrideUserInterfaceStyle = .dark
                }
            }
            
        case 2 :
            do {
                try Auth.auth().signOut()
                self.navigationController?.popToRootViewController(animated: true
                )
            }
            catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
        case 3 :
            let vf = ChangepasswordViewController()
            self.navigationController?.pushViewController(vf, animated: true)
            
        default:
            print("0")
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}





