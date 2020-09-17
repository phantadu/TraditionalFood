////
////  TrangChuViewController.swift
////  TraditionalFood
////
////  Created by M_catalina on 7/16/20.
////  Copyright © 2020 phan tá dự. All rights reserved.
////
//
import UIKit
import Firebase
import FirebaseDatabase
import SDWebImage
import RealmSwift
struct Food {
    var name: String
    var image: String?
    var country: String?
}
class TrangChuViewController: UIViewController {
    var ref = Database.database().reference()
    var foods : [Food] = []
    var curentfood : [Food] = []
    var countryFood: [Food] = []
    var favfood : Results<Foodmodel>?
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tabbleview : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trang Chủ"
        self.tabbleview.register(UINib(nibName: "FoodTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "FoodTable")
        ref.child("Quốc Gia").observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value as? [String:Any] else {return}
            for countryname in data.keys {
                let countryName = countryname as? String
                //In ten quoc gia
                //print(country)
                
                //Tat ca key: value cua mon an
                let dataFood = data[countryname] as! [String: Any]
                
                for namefood in dataFood.keys {
                    //In ten mon an
                    //                    print(namefood)
                    let name = namefood as? String
                    //                    print(nameFood)
                    //lay tat ca thong tin cua mon an
                    let thongtin = dataFood[namefood] as! [String: Any]
                    //                    print(thongtin)
                    let img = thongtin["Image"] as? String
                    print(img)
                    let foos = Food(name: namefood, image: img, country: countryName)
                    self.foods.append(foos)
                    self.curentfood = self.foods
                    self.tabbleview.reloadData()
                }
            }
        }
    }
    
}
extension TrangChuViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return curentfood.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "FoodTable", for: indexPath) as! FoodTableViewCell
        tablecell.namefood.text = curentfood[indexPath.row].name
        tablecell.nameCountry.text = curentfood[indexPath.row].country
        tablecell.imgview?.contentMode = .scaleAspectFill
        tablecell.imgview?.clipsToBounds = true
        tablecell.imgview.sd_setImage(with: URL(string: curentfood[indexPath.row].image ?? ""))
        tablecell.food = curentfood[indexPath.row]
        tablecell.prepare(food: curentfood[indexPath.row])
        return tablecell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.nameFood = foods[indexPath.row].name
        vc.country = foods[indexPath.row].country
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TrangChuViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            curentfood = foods
            tabbleview.reloadData()
            return}
        curentfood = foods.filter({food -> Bool in
         
            food.name.lowercased().contains(searchText.lowercased()) || food.country!.lowercased().contains(searchText.lowercased())
        })
        tabbleview.reloadData()
    }
    
}
