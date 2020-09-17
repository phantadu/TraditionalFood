//
//  yeuthichTableViewCell.swift
//  TraditionalFood
//
//  Created by phan tá dự on 8/22/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit
import RealmSwift

protocol YeuThichProtocol {
    func didSelectHeart()
}

class yeuthichTableViewCell: UITableViewCell {
    var dsyeuthich: UITableView!
    var yeuthichProtocol: YeuThichProtocol?
    @IBOutlet weak var yeuthichfood : UILabel!
    @IBOutlet weak var yeuthichcountry : UILabel!
    @IBOutlet weak var yeuthichimage : UIImageView!
    @IBOutlet weak var favoratedButton: UIButton!
    var food : Foodmodel!
    var favfood : Results<Foodmodel>?
    let realm = try! Realm()
    func removevalue(value: Foodmodel) {
        favfood = realm.objects(Foodmodel.self)
        do {
            try! realm.write {
                realm.delete(value)
            }
        }
    }
    func addvalue(value: Foodmodel) {
        let realm = try! Realm()
        do{
            try! realm.write(){
                realm.add(value)
            }
        }
    }
    
    func get(food: Foodmodel) -> Foodmodel? {
        let realm = try! Realm()
        let favfood = realm.objects(Foodmodel.self)
        
        var retValue: Foodmodel?
        favfood.forEach { (value) in
            if value.name == food.name {
                retValue = value
            }
        }
        return retValue
    }
    func prepare(food: Foodmodel) {
        self.food = food
        if self.get(food: food) == nil {
            self.favoratedButton.isSelected = true
            self.favoratedButton.tintColor = UIColor.blue
        } else {
            self.favoratedButton.isSelected = false
            self.favoratedButton.tintColor = UIColor.systemBlue
        }
    }
    @IBAction func click () {
        
        if let model = self.get(food: self.food) {
            self.removevalue(value: model)
            self.yeuthichProtocol?.didSelectHeart()
        } else {
            let model = Foodmodel()
            model.name = self.food.name
            model.country = self.food.country
            model.image = self.food.image
            self.addvalue(value: model)
            self.prepare(food: self.food)
        }
    }
}
