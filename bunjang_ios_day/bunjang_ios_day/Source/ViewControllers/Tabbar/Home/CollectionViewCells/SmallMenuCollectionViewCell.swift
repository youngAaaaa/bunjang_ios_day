//
//  SmallMenuCollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/23.
//

import UIKit

class SmallMenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    let menuImageList = [Image.menu1, Image.menu2, Image.menu3,
                         Image.menu4, Image.menu5, Image.menu6,
                         Image.menu7, Image.menu8, Image.menu9,
                         Image.menu10, Image.menu11, Image.menu12,
                         Image.menu13, Image.menu14
                         ]
    
    let menuTextList = ["찜", "나이키", "최근본상품",
                    "여성가방", "내피드", "스니커즈",
                    "내폰시세", "스타굿즈", "우리동네",
                    "캠핑", "친구초대", "골프",
                    "전체메뉴", "피규어/인형"
                    ]
    
    func setCell(_ indexPath: IndexPath){
        image.image = menuImageList[indexPath.row]
        label.text = menuTextList[indexPath.row]
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
