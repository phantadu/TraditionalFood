//
//  YeuThichViewController.swift
//  TraditionalFood
//
//  Created by M_catalina on 7/18/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//
import UIKit
import RealmSwift
import SDWebImage
class YeuThichViewController: UIViewController  {
    @IBOutlet weak var dsyeuthich: UITableView!
    var favfood : Results<Foodmodel>?
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "yeuthichTableViewCell", bundle: .main)
        dsyeuthich.register(nib, forCellReuseIdentifier: "FoodTable1")
        self.title = "Yêu Thích"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initData()
    }
    func initData() {
        let realm = try! Realm()
        favfood = realm.objects(Foodmodel.self)
        dsyeuthich.reloadData()
    }
}
extension YeuThichViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favfood!.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "FoodTable1", for: indexPath) as! yeuthichTableViewCell
        tablecell.yeuthichProtocol = self
        tablecell.yeuthichfood.text = favfood![indexPath.row].name
        tablecell.yeuthichcountry.text = favfood![indexPath.row].country
        tablecell.yeuthichimage.sd_setImage(with: URL(string: favfood![indexPath.row].image ?? ""))
        tablecell.yeuthichimage.clipsToBounds = true
        tablecell.yeuthichimage.contentMode = .scaleAspectFill
        tablecell.prepare(food: favfood![indexPath.row])
        return tablecell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.nameFood = favfood![indexPath.row].name
        vc.country = favfood![indexPath.row].country
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension YeuThichViewController: YeuThichProtocol {
    func didSelectHeart() {
        self.initData()
    }
}
