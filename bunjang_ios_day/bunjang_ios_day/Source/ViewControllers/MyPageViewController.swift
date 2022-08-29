//
//  MyPageViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "MyPageSection1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyPageSection1CollectionViewCell")
        collectionView.register(UINib(nibName: "MyPageSection2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyPageSection2CollectionViewCell")
        collectionView.register(UINib(nibName: "MyPageSection3CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyPageSection3CollectionViewCell")
        collectionView.register(UINib(nibName: "MyPageSection4CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyPageSection4CollectionViewCell")
        
        
    }
    
}

extension MyPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
            
        default:
            return 1
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPageSection1CollectionViewCell", for: indexPath) as! MyPageSection1CollectionViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPageSection2CollectionViewCell", for: indexPath) as! MyPageSection2CollectionViewCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPageSection3CollectionViewCell", for: indexPath) as! MyPageSection3CollectionViewCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPageSection4CollectionViewCell", for: indexPath) as! MyPageSection4CollectionViewCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPageSection1CollectionViewCell", for: indexPath) as! MyPageSection1CollectionViewCell
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        switch indexPath.section {
        case 0:
            return CGSize(width: width, height: 138)
        case 1:
            return CGSize(width: width, height: 110)
        case 2:
            return CGSize(width: width, height: 66)
        default:
            return CGSize(width: width, height: width)
        }
        
    }
    
}

