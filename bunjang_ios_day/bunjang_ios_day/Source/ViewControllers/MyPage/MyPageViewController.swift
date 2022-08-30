//
//  MyPageViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/29.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pointView: UIView!
    @IBOutlet weak var bankAccountView: UIView!
    
    var myPageCount : CountResult?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setDatas()
        setCollectionView()
    }
    
    private func configureView(){
        pointView.layer.cornerRadius = 10
        pointView.layer.borderColor = UIColor.lightGray.cgColor
        pointView.layer.borderWidth = 1
        
        bankAccountView.layer.cornerRadius = 10
        bankAccountView.layer.borderColor = UIColor.lightGray.cgColor
        bankAccountView.layer.borderWidth = 1
    }
    
    private func setDatas(){
        MyPageCountDataManager().getMyPageCount(storeID: Constant.storeID!, delegate: self)
    }
    
    private func setCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset.left = 20
        collectionView.contentInset.right = 20
        
        collectionView.register(UINib(nibName: "SmallCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SmallCollectionViewCell")
    }
}

extension MyPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCollectionViewCell", for: indexPath) as! SmallCollectionViewCell
        cell.setCell(indexPath)
        
        if indexPath.row == 0 {
            cell.label2.text = "신청"
        }
        else if indexPath.row == 3{
            let follwer = myPageCount?.followerCount
            cell.label2.text = "\(follwer ?? 0)"
        }
        else if indexPath.row == 4{
            let follewing = myPageCount?.followingCount
            cell.label2.text = "\(follewing ?? 0)"
        }
        else if indexPath.row == 6{
            cell.label2.text = "+11"
        }
        else if indexPath.row == 7{
            cell.label2.text = "OK"
        }
        else{
            cell.label2.text = "0"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

