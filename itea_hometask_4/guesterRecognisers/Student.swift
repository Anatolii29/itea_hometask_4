//
//  Student.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/21/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class Student: NSObject {
    
    var name = ""
    var surname = ""
    var age = 0
    var city = ""
    var course = ""
    var photo = ""
    
    init(name: String,
         surname: String,
         age: Int,
         city: String,
         course: String,
         photo: String) {
        
        self.name = name
        self.surname = surname
        self.age = age
        self.city = city
        self.course = course
        self.photo = photo
        
    }
    
}
