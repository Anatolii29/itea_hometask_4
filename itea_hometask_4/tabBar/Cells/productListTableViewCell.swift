//
//  productListTableViewCell.swift
//  itea_tabBar_hometask
//
//  Created by Anatolii on 5/5/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

protocol productListTableViewCellProtocol {
    func addProductToTrash(tag: Int)
}

class productListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription1: UILabel!
    @IBOutlet weak var productDescription2: UILabel!
    
    var delegate: productListViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update() {
        let currProduct =  delegate?.prodArray[tag]
        productImage.image = UIImage(named: currProduct?.image ?? "")
        productName.text = currProduct?.name
        productDescription1.text = currProduct?.detailDescription
        productDescription2.text = currProduct?.condition?.description
    }
    
    @IBAction func addToTrashPressed(_ sender: Any) {
        delegate?.addProductToTrash(tag: tag)
    }
}
