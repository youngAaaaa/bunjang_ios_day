//
//  ProductSection4CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class ProductSection4CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var profile: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        followButton.layer.cornerRadius = 5
        reviewButton.layer.cornerRadius = 5
    }

}
