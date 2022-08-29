//
//  MyPageSection1CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class MyPageSection1CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pointView: UIView!
    @IBOutlet weak var bankAccountView: UIView!
    
    @IBOutlet weak var pointLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        pointView.layer.cornerRadius = 10
        pointView.layer.borderWidth = 1
        pointView.layer.borderColor = UIColor.systemGray3.cgColor
        
        bankAccountView.layer.cornerRadius = 10
        bankAccountView.layer.borderWidth = 1
        bankAccountView.layer.borderColor = UIColor.systemGray3.cgColor
    }

}
