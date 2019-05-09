//
//  tabBarViewController.swift
//  itea_tabBar_hometask
//
//  Created by Anatolii on 5/5/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

//var productArray: [Product] = []

class tabBarViewController: UITabBarController {
    
    var productArray: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productArrayNamager()
    }
    
    func productArrayNamager() {
        let product1 = Product(name: "Картошка",
                               detailDescription: "упаковк картошки стандартного веса",
                               condition: productCondition.fresh,
                               image: "pot")
        let product2 = Product(name: "Капуста",
                               detailDescription: "белокачанная дворовая",
                               condition: productCondition.old,
                               image: "kap")
        let product3 = Product(name: "Морковь",
                               detailDescription: "пучек свежей моркови без ГМО",
                               condition: productCondition.old,
                               image: "mork")
        productArray.append(product1)
        productArray.append(product2)
        productArray.append(product3)
        
        let prodListViewController = self.viewControllers?[0] as? productListViewController
        prodListViewController?.startProgramFillArray(mainProdArray: productArray)
        let trashViewController = self.viewControllers?[1] as? trashViewController
//        trashViewController?.tableView.reloadData()
    }
}
