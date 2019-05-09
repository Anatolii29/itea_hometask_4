//
//  Product.swift
//  itea_tabBar_hometask
//
//  Created by Anatolii on 5/5/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

enum productCondition: String {
    
    case fresh = "как новый"
    case used = "подержанный"
    case old = "товар прострочен"
    case defaltValue = "не указано"
    
    var description: String {
        return self.rawValue
    }
}

class Product: NSObject {

    var name = ""
    var detailDescription = ""
    var condition: productCondition?
    var image = ""
    
    init(name: String, detailDescription: String, condition: productCondition?, image: String) {
        self.name = name
        self.detailDescription = detailDescription
        self.condition = condition
        self.image = image
    }
    
}
