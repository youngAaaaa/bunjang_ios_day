//
//  ProductSection1CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit
import ImageSlideshow
import Kingfisher

class ProductSection1CollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var productImage: ImageSlideshow!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    private func configureView() {
        
        productImage.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: 20))
        productImage.contentScaleMode = .scaleToFill
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = .clear
        pageIndicator.pageIndicatorTintColor = .clear
        productImage.pageIndicator = pageIndicator
        productImage.activityIndicator = DefaultActivityIndicator()
    }

}
