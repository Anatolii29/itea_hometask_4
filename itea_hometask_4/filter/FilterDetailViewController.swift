//
//  FilterDetailViewController.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/25/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class FilterDetailViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var hideButtonImage: UIImageView!
    @IBOutlet weak var descConstraint: NSLayoutConstraint!
    
    var needToHide = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func update(currProduct: FilterProduct) {
        view.reloadInputViews()
        productImage.image = UIImage(named: currProduct.image)
        productName.text = currProduct.name
        productPrice.text = String(currProduct.price)
        productDescription.text = currProduct.prodDescription
    }
    
    @IBAction func hideButtonPressed(_ sender: Any) {
        needToHide = !needToHide
        UIView.animate(withDuration: 0.5, animations: {
            self.descConstraint.constant = (self.needToHide ? 0 : 201)
            self.view.layoutIfNeeded()
        }) { (complete) in
            
        }
        hideButtonImage.image = (needToHide ? UIImage(named: "down") : UIImage(named: "up"))
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
