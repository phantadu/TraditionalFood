//
//  FoodTableViewCell.swift
//  TraditionalFood
//
//  Created by phan tá dự on 8/1/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage
import Firebase
import FirebaseDatabase
class FoodTableViewCell: UITableViewCell {
    @IBOutlet weak var nameCountry: UILabel!
    @IBOutlet weak var imgview : UIImageView!
    @IBOutlet weak var namefood : UILabel!
    @IBOutlet weak var favoratedButton: UIButton!
    var name: Foodmodel?
    var food: Food!
    func addvalue(value: Foodmodel) {
        let realm = try! Realm()
        do{
            try! realm.write(){
                realm.add(value)
            }
        }
    }
    func removevalue(value: Foodmodel) {
        let realm = try! Realm()
        do {
            try! realm.write {
                realm.delete(value)
            }
        }
    }
    func get(food: Food) -> Foodmodel? {
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
    func prepare(food: Food) {
        self.food = food
        if self.get(food: food) == nil {
            self.favoratedButton.isSelected = false
            self.favoratedButton.tintColor = UIColor.systemBlue
        } else {
            self.favoratedButton.isSelected = true
            self.favoratedButton.tintColor = UIColor.blue
        }
    }
    
    @IBAction func click (sender : UIButton) {
        if let model = self.get(food: self.food) {
            self.removevalue(value: model)
        } else {
            let model = Foodmodel()
            model.name = self.food.name
            model.country = self.food.country ?? ""
            model.image = self.food.image
            self.addvalue(value: model)
        }
        self.prepare(food: self.food)
    }
}



