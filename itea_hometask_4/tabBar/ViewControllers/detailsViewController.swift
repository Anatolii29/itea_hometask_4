//
//  detailsViewController.swift
//  itea_tabBar_hometask
//
//  Created by Anatolii on 5/6/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit
//import SCLAlertView

class detailsViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var detailProdDescription: UILabel!
    @IBOutlet weak var prodDescription: UILabel!
    @IBOutlet weak var prodName: UILabel!
    
    var currProduct: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInfo()
    }
    
    func update(prod: Product?) {
        currProduct = prod
        updateInfo()
    }
    
    func updateInfo() {
        if image != nil {
            image.image = UIImage(named: currProduct?.image ?? "default")
            detailProdDescription.text = currProduct?.detailDescription ?? "Детальное описание"
            prodName.text = currProduct?.name ?? "Товар не выбран"
            prodDescription.text = currProduct?.condition?.description ?? "Свежесть товара"
        }
    }
    
    @IBAction func putToTrashPressed(_ sender: Any) {
        let trashViewController = tabBarController?.viewControllers?[1] as? trashViewController
        trashViewController?.update(prod: currProduct)
        
        let productListViewController = tabBarController?.viewControllers?[0] as? productListViewController
        productListViewController?.remove(prod: currProduct)
        
        
        //            let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showSuccess("Hello World", subTitle: "This is a more descriptive text.")
        //            alertViewResponder.setTitle("\(String(currProduct?.name ?? ""))") // Rename title
        //            alertViewResponder.setSubTitle("Товар успешно помещен в корзину") // Rename subtitle
        //
    }
}
