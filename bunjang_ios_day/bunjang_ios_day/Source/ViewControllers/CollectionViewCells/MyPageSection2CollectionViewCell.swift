//
//  MyPageSection2CollectionViewCell.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class MyPageSection2CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset.left = 20
        
        collectionView.register(UINib(nibName: "SmallCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SmallCollectionViewCell")
    }

}

extension MyPageSection2CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCollectionViewCell", for: indexPath) as! SmallCollectionViewCell
        cell.setCell(indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
