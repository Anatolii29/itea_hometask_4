//
//  studentDetailViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class studentDetailViewController: UIViewController {
    
    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentFamilyName: UILabel!
    @IBOutlet weak var studentAge: UILabel!
    @IBOutlet weak var studentCity: UILabel!
    @IBOutlet weak var studentCourse: UILabel!
    
    var studentArray: [Student]?
    var currStudentIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        setGuester(direction: .left, selector: #selector(swipeLeft))
        setGuester(direction: .right, selector: #selector(swipeRight))
        
    }
    
    func update() {
        view.reloadInputViews()
        studentImage.image =
            UIImage(named: (studentArray?[currStudentIndex!].photo)!) == nil ? UIImage(named: "default") :
            UIImage(named: (studentArray?[currStudentIndex!].photo)!)
        studentName.text = studentArray?[currStudentIndex!].name
        studentFamilyName.text = studentArray?[currStudentIndex!].surname
        studentAge.text = String(studentArray?[currStudentIndex!].age ?? 0)
        studentCity.text = studentArray?[currStudentIndex!].city
        studentCourse.text = studentArray?[currStudentIndex!].course
    }
    
    func setGuester(direction: UISwipeGestureRecognizer.Direction, selector: Selector) {
        let swipeGuester = UISwipeGestureRecognizer(target: self, action: selector)
        swipeGuester.direction = direction
        self.view.addGestureRecognizer(swipeGuester)
    }
    
    func showStudent(direction: UISwipeGestureRecognizer.Direction) {
        if studentArray!.count > 1 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "studentDetailViewController") as! studentDetailViewController
            vc.studentArray = studentArray
            switch direction {
            case .left:
                vc.currStudentIndex = currStudentIndex == studentArray!.endIndex - 1 ? studentArray?.startIndex : studentArray?.index(after: currStudentIndex!)
            case .right:
                vc.currStudentIndex = currStudentIndex == studentArray?.startIndex ? studentArray!.endIndex - 1 : studentArray?.index(before: currStudentIndex!)
            default:
                _ = true
            }
            vc.update()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        let vc = self.navigationController?.viewControllers[1] as! studentCollectionViewController
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @objc func swipeLeft(gesture: UISwipeGestureRecognizer) -> Void {
        showStudent(direction: gesture.direction)
    }
    
    @objc func swipeRight(gesture: UISwipeGestureRecognizer) -> Void {
        showStudent(direction: gesture.direction)
    }
    
}
