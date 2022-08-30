//
//  SmallCollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    
    let menuTextList = ["택배", "평점", "거래내역", "팔로워", "팔로잉", "안전결제", "오픈일", "본인인증"]
    
    
    func setCell(_ indexPath: IndexPath){
        label1.text = menuTextList[indexPath.row]
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 10
        
    }

}
