//
//  Product.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/25/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class FilterProduct: NSObject {
    
    var name = ""
    var price = 0
    var image = ""
    var prodDescription = ""
    
    init(name: String, price: Int, image: String, desc: String) {
        self.name = name
        self.price = price
        self.image = image
        self.prodDescription = desc
    }

}
