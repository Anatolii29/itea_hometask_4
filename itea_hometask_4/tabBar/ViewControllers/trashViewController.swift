//
//  trashViewController.swift
//  itea_tabBar_hometask
//
//  Created by Anatolii on 5/5/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class trashViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var deletedProdArray: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "trashTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "trashTableViewCell")
    }
    
    func update(prod: Product?) {
        if let currProduct = prod {
            deletedProdArray.append(currProduct)
        }
        if tableView != nil {
            tableView.reloadData()
        }
    }
}

extension trashViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deletedProdArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trashTableViewCell", for: indexPath) as! trashTableViewCell
        cell.delegate = self
        cell.tag = indexPath.row
        cell.update()
        return cell
    }
}

extension trashViewController: trashTableViewCellProtocol {
    
    func removeProductFromTrash(tag: Int) {
        
        let productListViewController = tabBarController?.viewControllers?[0] as? productListViewController
        productListViewController?.update(prod: deletedProdArray[tag])
        deletedProdArray.remove(at: tag)
        tableView.reloadData()
    }
    
}
