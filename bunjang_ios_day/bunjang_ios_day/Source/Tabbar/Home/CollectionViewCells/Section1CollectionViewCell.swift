//
//  Section1CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/23.
//

import UIKit
import ImageSlideshow

class Section1CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImageSlides: ImageSlideshow!
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
        
        bannerImageSlides.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: 20))
        bannerImageSlides.contentScaleMode = .scaleToFill
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = .clear
        pageIndicator.pageIndicatorTintColor = .clear
        bannerImageSlides.pageIndicator = pageIndicator
        bannerImageSlides.activityIndicator = DefaultActivityIndicator()
        bannerImageSlides.setImageInputs(imageInputs)
    }

}
