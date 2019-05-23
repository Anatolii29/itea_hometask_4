//
//  studentDetailsViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/22/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class studentDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var photoLabel: UILabel!
    
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = student?.name
        surnameLabel.text = student?.surname
        ageLabel.text = String(student?.age ?? 0)
        cityLabel.text = student?.city
        courseLabel.text = student?.course
        photoLabel.text = student?.photo
        
    }
    
}
