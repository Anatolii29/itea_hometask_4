//
//  studentCollectionViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/15/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class studentCollectionViewController: UIViewController {
    
    @IBOutlet weak var studentCollectionView: UICollectionView!
    
    var studentArray: [Student]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        studentCollectionView.delegate = self
        studentCollectionView.dataSource = self
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
    }
    
}

extension studentCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentArray!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "studentCollectionViewCell", for: indexPath) as! studentCollectionViewCell
        item.update(currStudent: studentArray![indexPath.row])
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "studentDetailViewController") as! studentDetailViewController
        vc.studentArray = studentArray
        vc.currStudentIndex = indexPath.row
        vc.update()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
