//
//  practiceViewController.swift
//  itea_tapbar
//
//  Created by Anatolii on 5/6/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class practiceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var lectureArray: [Lecture] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "practiceTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "practiceTableViewCell")
        lectureManager()
    }
    
    func lectureManager() {
        
        let lecture1 = Lecture(name: "Курс лекций по физике", date: "дневные", teacher: Teacher(name: "Сергей Сергеич"))
        lectureArray.append(lecture1)
        let lecture2 = Lecture(name: "Курс лекций по математике", date: "вечерние", teacher: Teacher(name: "Сергей Сергеич"))
        lectureArray.append(lecture2)
        let lecture3 = Lecture(name: "Курс лекций по математике", date: "утренние", teacher: Teacher(name: "Иван Иваныч"))
        lectureArray.append(lecture3)
        
    }
}

extension practiceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor.lightGray
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        if section == 0 {
            label.text = "Дата курса"
        }
        else if section == 1 {
            label.text = "Название курса"
        }
        else if section == 2 {
            label.text = "Имя лектора"
        }
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "practiceTableViewCell", for: indexPath) as! practiceTableViewCell
        cell.delegate = self
        cell.update(section: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        var currLecture: Lecture
        tableView.cellForRow(at: indexPath)
        if indexPath.section == 0  {
            currLecture = findLecture(section: indexPath.section)
        }
        vc.update(lecture: currLecture)
    }
    
    func findLecture(section: Int) -> Lecture? {
        var currLecture: Lecture?
        if section == 0 {
            for (index, item) in lectureArray.enumerated(){
//                if item.date ==
                tableView.cellForRow(at: <#T##IndexPath#>)
            }
        }
    }
}
