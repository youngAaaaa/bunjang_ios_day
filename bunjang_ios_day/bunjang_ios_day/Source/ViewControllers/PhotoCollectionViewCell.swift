//
//  PhotoCollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/26.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var number: UILabel!
    
    var representedAssetIdentifier: String?
    
    override func awakeFromNib() {
        number.text = ""
        super.awakeFromNib()
    }

}
