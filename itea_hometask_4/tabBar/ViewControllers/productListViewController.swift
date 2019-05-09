//
//  productListViewController.swift
//  itea_tabBar_hometask
//
//  Created by Anatolii on 5/5/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class productListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var prodArray: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: "productListTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "productListTableViewCell")
        tableView.reloadData()
    }
    
    func startProgramFillArray(mainProdArray: [Product]) {
        for prod in mainProdArray {
            update(prod: prod)
        }
    }
    
    func update(prod: Product?) {
        if let currProduct = prod {
            prodArray.append(currProduct)
        }
        if tableView != nil {
            tableView.reloadData()
        }
    }
    
    func remove(prod: Product?) {
        let defaultProduct = Product(name: "", detailDescription: "", condition: productCondition.defaltValue, image: "")
        let prodIndex = prodArray.firstIndex(of: prod ?? defaultProduct) ?? -1
        if prodIndex >= 0 {
            prodArray.remove(at: prodIndex)
            tableView.reloadData()
        }
    }
    
}

extension productListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productListTableViewCell", for: indexPath) as! productListTableViewCell
        tableView.rowHeight = cell.frame.height
        cell.delegate = self
        cell.tag = indexPath.row
        cell.update()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = tabBarController?.viewControllers?[2] as? detailsViewController
        detailsViewController?.update(prod: prodArray[indexPath.row])
    }
}

extension productListViewController: productListTableViewCellProtocol {
    
    func addProductToTrash(tag: Int) {
        let trashViewController = tabBarController?.viewControllers?[1] as? trashViewController
        trashViewController?.update(prod: prodArray[tag])
        remove(prod: prodArray[tag])
    }
    
}

