//
//  detailsViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/10/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    
    @IBOutlet weak var lectureImage: UIImageView!
    @IBOutlet weak var labelName1: UILabel!
    @IBOutlet weak var labelName2: UILabel!
    @IBOutlet weak var labelName3: UILabel!
    @IBOutlet weak var label1Description: UILabel!
    @IBOutlet weak var label2Description: UILabel!
    @IBOutlet weak var label3Description: UILabel!
    
    var currentLecture: Lecture?
    var currentSection: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    func update(lecture: Lecture?, section: Int) {
        currentLecture = lecture
        currentSection = section
    }
    
    func fillData() {
        switch currentSection {
        case 0:
            fillElementsByLecture()
        case 1:
            fillElementsByLecture()
        case 2:
            fillElementsByTeacher()
        default:
            break
        }
    }
    
    func fillElementsByLecture() {
        lectureImage.image = UIImage(named: currentLecture?.image ?? "default")
        labelName1.text = "Название лекции"
        labelName2.text = "Дата лекции"
        labelName3.text = "Учитель"
        label1Description.text = currentLecture?.name
        label2Description.text = currentLecture?.date
        label3Description.text = currentLecture?.teacher?.name
    }
    
    func fillElementsByTeacher() {
        lectureImage.image = UIImage(named: currentLecture?.teacher?.image ?? "default")
        labelName1.text = "Имя учителя"
        labelName2.text = "Фамилия учителя"
        labelName3.text = "Специализация"
        label1Description.text = currentLecture?.teacher?.name
        label2Description.text = currentLecture?.teacher?.familyName
        label3Description.text = currentLecture?.teacher?.specialization
    }
}
