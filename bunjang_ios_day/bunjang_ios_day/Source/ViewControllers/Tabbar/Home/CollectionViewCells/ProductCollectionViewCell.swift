//
//  ProductCollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/22.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dibsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        productImage.layer.cornerRadius = 10
    }

}
