//
//  filterCollectionViewCell.swift
//  itea_hometask_4
//
//  Created by Anatolii on 5/23/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class filterCollectionViewCell: UICollectionViewCell {
    
    var product: FilterProduct?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var detailsView: UIView!
    
    func update(currProduct: FilterProduct) {
        product = currProduct
        
        image.image = UIImage(named: product?.image ?? "default")
        productName.text = product?.name
        productPrice.text = String(product!.price)
        
        detailsView.layer.cornerRadius = 8
    }
}
