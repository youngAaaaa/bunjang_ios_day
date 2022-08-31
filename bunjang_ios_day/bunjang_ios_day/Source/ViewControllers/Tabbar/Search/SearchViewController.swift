//
//  SearchViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var bannerImage: UIImageView!
    
    @IBOutlet weak var followButton1: UIButton!
    @IBOutlet weak var followButton2: UIButton!
    @IBOutlet weak var followButton3: UIButton!
    @IBOutlet weak var followButton4: UIButton!
    @IBOutlet weak var followButton5: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerImage.layer.cornerRadius = 10
        
        configureView()
        setCollectionView()
    }
    
    private func configureView(){
        followButton1.layer.cornerRadius = 5
        followButton2.layer.cornerRadius = 5
        followButton3.layer.cornerRadius = 5
        followButton4.layer.cornerRadius = 5
        followButton5.layer.cornerRadius = 5
        
        moreButton.layer.cornerRadius = 5
    }
    
    private func setCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset.left = 20
        collectionView.contentInset.right = 20
        collectionView.register(UINib(nibName: "SearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchCollectionViewCell")
    }

}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        cell.setCell(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
