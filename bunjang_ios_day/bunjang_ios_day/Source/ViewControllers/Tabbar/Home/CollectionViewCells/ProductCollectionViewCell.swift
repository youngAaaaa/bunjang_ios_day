//
//  ProductCollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/22.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.layer.cornerRadius = 10
    }

}
