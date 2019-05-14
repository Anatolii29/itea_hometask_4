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
    var itemChoosedInCell: [Int] = []
    var sectionNames = [
        0: "Дата курса",
        1: "Название курса",
        2: "Имя лектора",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "practiceTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "practiceTableViewCell")
        lectureManager()
    }
    
    func lectureManager() {
        
        let lecture1 = Lecture(name: "Курс лекций по физике",
                               date: "дневные",
                               image: "lecture",
                               teacher: Teacher(name: "Дядя Вася из 3го парадного ", image: "jolie", familyName: "Вася из 3го парадного", specialization: "ядерная физика"))
        lectureArray.append(lecture1)
        let lecture2 = Lecture(name: "Курс лекций по математике",
                               date: "вечерние",
                               image: "lecture",
                               teacher: Teacher(name: "Сергей Сергеич", image: "pitt", familyName: "Питт", specialization: "высшая математика"))
        lectureArray.append(lecture2)
        let lecture3 = Lecture(name: "Курс лекций по теории вероятности",
                               date: "утренние",
                               image: "lecture",
                               teacher: Teacher(name: "Иван Петрович", image: "default", familyName: "Петрович", specialization: "просто космос"))
        lectureArray.append(lecture3)
        
        itemChoosedInCell.append(4)
        itemChoosedInCell.append(4)
        itemChoosedInCell.append(4)
    }
}

extension practiceViewController: UITableViewDelegate, UITableViewDataSource, practiceTableViewCellProtocol {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = UIColor.lightGray
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        label.text = sectionNames[section]
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
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
        let currItemChoosed = itemChoosedInCell[indexPath.section]
        let currLecture = (currItemChoosed >= lectureArray.count) ? nil : lectureArray[currItemChoosed]
        vc.update(lecture: currLecture, section: indexPath.section)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setIndexValueChoosed(index: Int, section: Int) {
        itemChoosedInCell[section] = index
    }
    
}
