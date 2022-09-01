//
//  SmallPhotoCollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import UIKit

class SmallPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var representedAssetIdentifier: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
