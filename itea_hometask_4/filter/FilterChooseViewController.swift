//
//  FilterChooseViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/23/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class FilterChooseViewController: UIViewController {
    
    @IBOutlet weak var sortByNameInsideView: UIView!
    @IBOutlet weak var sortByNameOutsideView: UIView!
    @IBOutlet weak var sortByPriceOutsideView: UIView!
    @IBOutlet weak var sortByPriceinsideView: UIView!
    
    var arrayOffsideView: [UIView] = []
    var arrayInsideView: [UIView] = []
    var index = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOffsideView = [sortByNameOutsideView, sortByPriceOutsideView]
        arrayInsideView = [sortByNameInsideView, sortByPriceinsideView]
        cornerRadius()
        
    }
    
    func cornerRadius() {
        
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
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let vc = self.navigationController?.viewControllers[0] as! filterViewController
        vc.sortingIndex = index
        vc.sort()
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction func byPriceButtonPressed(_ sender: Any) {
        index = 1
        cornerRadius()
    }
    
    @IBAction func byNameButtonPressed(_ sender: Any) {
        index = 0
        cornerRadius()
    }
    
}
