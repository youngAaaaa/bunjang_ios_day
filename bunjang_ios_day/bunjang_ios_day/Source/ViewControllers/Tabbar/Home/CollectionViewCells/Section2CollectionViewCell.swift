//
//  Section2CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/23.
//

import UIKit

class Section2CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var menuCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let collectionViewCellNib = UINib(nibName: "SmallMenuCollectionViewCell", bundle: nil)
        menuCollectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "SmallMenuCollectionViewCell")
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        menuCollectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 160, bottom: 0, right: 160)
        menuCollectionView.contentInset.left = 10
    }

}

extension Section2CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: "SmallMenuCollectionViewCell", for: indexPath) as! SmallMenuCollectionViewCell
        cell.setCell(indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
//        if indexPath.row == 12 {
//            let nextStoryboard = UIStoryboard(name: "AllMenus", bundle: nil)
//            let vc = nextStoryboard.instantiateViewController(withIdentifier: "AllMenusViewController") as! AllMenusViewController
//            let curStoryboard = UIStoryboard(name: "Home", bundle: nil)
//
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
}

