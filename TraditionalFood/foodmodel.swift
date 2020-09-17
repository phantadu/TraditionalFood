//
//  foodmodel.swift
//  TraditionalFood
//
//  Created by phan tá dự on 8/22/20.
//  Copyright © 2020 phan tá dự. All rights reserved.
//

import Foundation
import RealmSwift

class Foodmodel: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var country : String = ""
    @objc dynamic var image :String?
}

