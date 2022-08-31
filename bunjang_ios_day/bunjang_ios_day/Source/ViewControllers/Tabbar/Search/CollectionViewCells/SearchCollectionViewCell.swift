//
//  SearchCollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var num2: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    let menuTextList = ["애플펜슬", "사카이", "쿠팡", "고전문구", "올리브영",
                        "챠미키티", "네이버", "스타벅스", "블랙핑크 콘서트", "갤럭시탭s7"]
    
    func setCell(_ index: Int){
        textLabel.text = menuTextList[index]
        
        let num = index + 1
        if num == 10 {
            num2.text = "\(num)"
        } else { num2.text = "0\(num)" }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 5
        bgView.layer.borderColor = UIColor.systemGray4.cgColor
        bgView.layer.borderWidth = 1
    }

}
