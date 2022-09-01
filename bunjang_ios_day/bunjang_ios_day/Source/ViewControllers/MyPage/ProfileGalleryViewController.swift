//
//  ProfileGalleryViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import UIKit
import Photos

protocol SelectedProfileDelegate: AnyObject {
    func sendImages(images: UIImage)
}

class ProfileGalleryViewController: UIViewController {
    
    weak var delegate: SelectedProfileDelegate?
    var uploadImage: UIImage?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tapDoneButton(_ sender: UIButton) {
        delegate?.sendImages(images: uploadImage!)
        dismiss(animated: true)
    }
    
    var asset: PHFetchResult<PHAsset>
    
    init() {
        let phFetchOptions = PHFetchOptions()
        phFetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        self.asset = PHAsset.fetchAssets(with: phFetchOptions)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageManager = PHCachingImageManager()
    
    
    private let cellWidth = (UIScreen.main.bounds.width) / 3
    private let kPhotoCell = "SmallPhotoCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PHPhotoLibrary.shared().register(self)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: kPhotoCell, bundle: nil), forCellWithReuseIdentifier: kPhotoCell)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name("DismissProfileGallaryView"), object: nil, userInfo: nil)
    }

}

extension ProfileGalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asset.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCell, for: indexPath) as! SmallPhotoCollectionViewCell
        let asset = self.asset[indexPath.item]
        let scale: CGFloat = UIScreen.main.scale // 화질 향상
        cell.representedAssetIdentifier = asset.localIdentifier
        imageManager.requestImage(for: asset, targetSize: CGSize(width: cellWidth * scale, height: cellWidth * scale), contentMode: .aspectFill, options: nil) { image, _ in
            if cell.representedAssetIdentifier == asset.localIdentifier {
                cell.imageView.image = image
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SmallPhotoCollectionViewCell
        uploadImage = cell.imageView.image
        delegate?.sendImages(images: uploadImage!)
        dismiss(animated: true)
    }
    
}

extension ProfileGalleryViewController: PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: self.asset) else {
            return
        }
        
        if changes.hasIncrementalChanges {
            DispatchQueue.main.async {
                self.collectionView.performBatchUpdates {
                    if let inserted = changes.insertedIndexes, !inserted.isEmpty {
                        self.collectionView.insertItems(at: inserted.map({ IndexPath(item: $0, section: 0) }))
                    }
                    if let removed = changes.removedIndexes, !removed.isEmpty {
                        self.collectionView.deleteItems(at: removed.map({ IndexPath(item: $0, section: 0) }))
                    }
                }
            }
        }
    }
}
