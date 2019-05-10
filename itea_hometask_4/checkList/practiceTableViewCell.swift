//
//  practiceTableViewCell.swift
//  itea_tapbar
//
//  Created by Anatolii on 5/6/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

protocol practiceTableViewCellProtocol {
    func getCurrentLecture(index: Int)
}

class practiceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var offsideView1: UIView!
    @IBOutlet weak var insideView1: UIView!
    @IBOutlet weak var offsideView2: UIView!
    @IBOutlet weak var insideView2: UIView!
    @IBOutlet weak var offsideView3: UIView!
    @IBOutlet weak var insideView3: UIView!
    
    var arrayOffsideView: [UIView] = []
    var arrayInsideView: [UIView] = []
    var arrayOfLabels: [UILabel] = []
    var delegate: practiceViewController?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(section: Int) {
        
        arrayOffsideView = [offsideView1, offsideView2, offsideView3]
        arrayInsideView  = [insideView1, insideView2, insideView3]
        arrayOfLabels  = [label1, label2, label3]
        cornerRadius(index: 4)
        
        fillData(section: section)
    }
    
    func fillData(section: Int) {
    
        if section == 0 {
            var dateArray: [String] = []
            if let currDateArray = delegate?.lectureArray {
                for item in currDateArray {
                    dateArray.append(item.date)
                }
            }
            for (index, item) in dateArray.enumerated(){
                arrayOfLabels[index].text = item
            }
        }
        else if section == 1 {
            var nameArray: [String] = []
            if let currNameArray = delegate?.lectureArray {
                for item in currNameArray {
                    nameArray.append(item.name)
                }
            }
            for (index, item) in nameArray.enumerated(){
                arrayOfLabels[index].text = item
            }
        }
        else if section == 2 {
            var teacherArray: [Teacher] = []
            if let currTeacherArray = delegate?.lectureArray {
                for item in currTeacherArray {
                    teacherArray.append(item.teacher!)
                }
            }
            for (index, item) in teacherArray.enumerated(){
                arrayOfLabels[index].text = item.name
            }
        }
        
    }
    
    func cornerRadius(index: Int) {
        
        for view in arrayOffsideView {
            view.clipsToBounds =  true
            view.layer.cornerRadius = view.frame.size.height / 2
            view.layer.borderWidth = 0.5
            view.layer.borderColor = UIColor.black.cgColor
        }
        for (i, view) in arrayInsideView.enumerated() {
            view.isHidden = (i == index) ? false : true
            view.clipsToBounds =  true
            view.layer.cornerRadius = view.frame.size.height / 2
        }
        findElementInLectureArray()
  
    }
    
    func findElementInLectureArray() {
        
    }
    
    @IBAction func button3Pressed(_ sender: Any) {
        cornerRadius(index: 2)
    }
    
    @IBAction func button2Pressed(_ sender: Any) {
        cornerRadius(index: 1)
    }
    
    @IBAction func button1Pressed(_ sender: Any) {
        cornerRadius(index: 0)
    }
}
