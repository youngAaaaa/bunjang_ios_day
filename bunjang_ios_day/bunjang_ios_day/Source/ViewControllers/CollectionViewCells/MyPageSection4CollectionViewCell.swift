//
//  MyPageSection4CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class MyPageSection4CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "MenusCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenusCollectionViewCell")
        collectionView.register(UINib(nibName: "SalesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SalesCollectionViewCell")
        collectionView.register(UINib(nibName: "ReservedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReservedCollectionViewCell")
        
    }
    
}
extension MyPageSection4CollectionViewCell:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        default:
            return 2
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenusCollectionViewCell", for: indexPath) as! MenusCollectionViewCell
            cell.accessibilityScroll(UIAccessibilityScrollDirection.left)
            return cell
        case 1:
            switch indexPath.row{
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SalesCollectionViewCell", for: indexPath) as! SalesCollectionViewCell
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReservedCollectionViewCell", for: indexPath) as! ReservedCollectionViewCell
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SalesCollectionViewCell", for: indexPath) as! SalesCollectionViewCell
                return cell
                
            }
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenusCollectionViewCell", for: indexPath) as! MenusCollectionViewCell
            return cell
        }
    }
    
    private func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        if indexPath.row == 2 {
            let cell = collectionView.cellForItem(at: indexPath) as! MenusCollectionViewCell
            return cell
                    //cell.label.textColor = .lightGray
        }
        let cell = collectionView.cellForItem(at: indexPath) as! SalesCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        switch indexPath.section {
        case 0:
            return CGSize(width: 100, height: 50)
        case 1:
            return CGSize(width: width, height: height)
        default:
            return CGSize(width: width, height: width)
        }
        
    }
    
}
