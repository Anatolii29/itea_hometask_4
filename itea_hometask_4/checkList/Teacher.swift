//
//  Teacher.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/9/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class Teacher: NSObject {
    
    var name = ""
    var image = ""
    var familyName = ""
    var specialization = ""
    
    init(name: String, image: String, familyName: String, specialization: String) {
        self.name = name
        self.image = image
        self.familyName = familyName
        self.specialization = specialization
    }
}
