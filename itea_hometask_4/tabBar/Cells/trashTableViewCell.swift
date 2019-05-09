//
//  trashTableViewCell.swift
//  itea_tabBar_hometask
//
//  Created by Anatolii on 5/5/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

protocol trashTableViewCellProtocol {
    func removeProductFromTrash(tag: Int)
}

class trashTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productName: UILabel!
    
    var delegate: trashViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update() {
        let currProduct =  delegate?.deletedProdArray[tag]
        productName.text = currProduct?.name
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        delegate?.removeProductFromTrash(tag: tag)
    }
    
}
