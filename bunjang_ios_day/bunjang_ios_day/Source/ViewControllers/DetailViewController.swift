//
//  DetailViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(UINib(nibName: "ProductSection1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductSection1CollectionViewCell")
        collectionView.register(UINib(nibName: "ProductSection2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductSection2CollectionViewCell")
        collectionView.register(UINib(nibName: "ProductSection3CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductSection3CollectionViewCell")
        collectionView.register(UINib(nibName: "ProductSection4CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductSection4CollectionViewCell")
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
            
        case 1:
            return 1
            
        default:
            return 4
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            switch indexPath.row {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSection1CollectionViewCell", for: indexPath) as! ProductSection1CollectionViewCell
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSection2CollectionViewCell", for: indexPath) as! ProductSection2CollectionViewCell
                return cell
            case 2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSection3CollectionViewCell", for: indexPath) as! ProductSection3CollectionViewCell
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSection1CollectionViewCell", for: indexPath) as! ProductSection1CollectionViewCell
                return cell
            }
        case 1:
            switch indexPath.row {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSection4CollectionViewCell", for: indexPath) as! ProductSection4CollectionViewCell
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSection4CollectionViewCell", for: indexPath) as! ProductSection4CollectionViewCell
                return cell
            }
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSection1CollectionViewCell", for: indexPath) as! ProductSection1CollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return CGSize(width: width, height: width)
            case 1:
                return CGSize(width: width, height: 262.5)
            case 2:
                return CGSize(width: width, height: 160)
            default:
                return CGSize(width: width, height: width)
            }
        case 1:
            let size = CGSize(width: width, height: 232)
            return size
        default:
            return CGSize(width: width, height: 80)
        }
    }
    
    
}
