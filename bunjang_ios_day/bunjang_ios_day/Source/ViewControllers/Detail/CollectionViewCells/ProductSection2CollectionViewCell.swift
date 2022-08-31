//
//  ProductSection2CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class ProductSection2CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var deliveryView: UIView!
    @IBOutlet weak var exchangeView: UIView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stateView.layer.cornerRadius = 10
        numberView.layer.cornerRadius = 10
        deliveryView.layer.cornerRadius = 10
        exchangeView.layer.cornerRadius = 10
    }

}
