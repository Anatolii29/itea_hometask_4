//
//  Lecture.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/9/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class Lecture: NSObject {

    var name = ""
    var date = ""
    var teacher: Teacher?
    
    init (name: String, date: String, teacher: Teacher) {
        self.name = name
        self.date = date
        self.teacher = teacher
    }
}
