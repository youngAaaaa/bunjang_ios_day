//
//  HomeViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/21.
//

import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var headerMenu1: UIBarButtonItem!
    @IBOutlet weak var headerMenu2: UIBarButtonItem!
    @IBOutlet weak var headerMenu3: UIBarButtonItem!
    
    @IBOutlet weak var bannerImageSlides: ImageSlideshow!
    let imageInputs = [
        ImageSource(image: UIImage(named: "배너1")!),
        ImageSource(image: UIImage(named: "배너2")!),
        ImageSource(image: UIImage(named: "배너3")!),
        ImageSource(image: UIImage(named: "배너4")!),
        ImageSource(image: UIImage(named: "배너5")!),
        ImageSource(image: UIImage(named: "배너6")!),
        ImageSource(image: UIImage(named: "배너7")!)
    ]
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView() {
        
        mainLabel.text = "전국의 사람과 물건이 헤어지고\n다시 만나는 번개장터입니다💞"
        
        scrollView.delegate = self
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        menuCollectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 160, bottom: 0, right: 160)
        menuCollectionView.contentInset.left = 10
        
        
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

// MARK: UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            headerMenu1.tintColor = .black
            headerMenu2.tintColor = .black
            headerMenu3.tintColor = .black
            
            let color = UIColor(red: 255, green: 255, blue: 255, alpha: scrollView.contentOffset.y / 350)
            self.navigationController?.navigationBar.backgroundColor = color
            
        } else {
            headerMenu1.tintColor = .white
            headerMenu2.tintColor = .white
            headerMenu3.tintColor = .white
            
            self.navigationController?.navigationBar.backgroundColor = .clear
        }
    }
}

// MARK: UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        cell.button.setImage(UIImage(named: "메뉴\(indexPath.row + 1)"), for: .normal)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //행간 높이
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return -20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.frame.height) / 2
        let width = height
        let size = CGSize(width: width, height: height)
        return size
    }
}

