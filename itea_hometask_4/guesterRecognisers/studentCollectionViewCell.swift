//
//  studentCollectionViewCell.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class studentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    
    func update(currStudent: Student) {
        studentImage.image = UIImage(named: currStudent.photo) == nil ? UIImage(named: "default") : UIImage(named: currStudent.photo)
        studentNameLabel.text = currStudent.name
    }
}
