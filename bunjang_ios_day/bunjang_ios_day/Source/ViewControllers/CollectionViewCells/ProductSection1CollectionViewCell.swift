//
//  ProductSection1CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit
import ImageSlideshow

class ProductSection1CollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var productImage: ImageSlideshow!
    let imageInputs = [
        ImageSource(image: Image.banner1),
        ImageSource(image: Image.banner2),
        ImageSource(image: Image.banner3),
        ImageSource(image: Image.banner4),
        ImageSource(image: Image.banner5),
        ImageSource(image: Image.banner6),
        ImageSource(image: Image.banner7)
    ]
    
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
        productImage.setImageInputs(imageInputs)
    }

}
