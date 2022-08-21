//
//  LoginViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/20.
//

import UIKit
import ImageSlideshow

class LoginViewController: UIViewController {
    
    @IBOutlet weak var imageSlidesShow: ImageSlideshow!
    let imageInputs = [
        ImageSource(image: UIImage(named: "로그인1")!),
        ImageSource(image: UIImage(named: "로그인2")!),
        ImageSource(image: UIImage(named: "로그인3")!),
        ImageSource(image: UIImage(named: "로그인4")!)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView() {
        imageSlidesShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        imageSlidesShow.contentScaleMode = .scaleAspectFit
        
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = .black
        pageIndicator.pageIndicatorTintColor = .systemGray5
        imageSlidesShow.pageIndicator = pageIndicator
        
        imageSlidesShow.activityIndicator = DefaultActivityIndicator()
        imageSlidesShow.delegate = self
        
        imageSlidesShow.setImageInputs(imageInputs)
    }
    
}

extension LoginViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
