//
//  GallaryViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/26.
//

import UIKit
import Photos

protocol SelectedImagesDelegate: AnyObject {
    func sendImages(images: [UIImage?], number: Int)
}

class GallaryViewController: UIViewController {
    
    weak var delegate: SelectedImagesDelegate?
    
    // MARK: 사진
    var tmpImg: UICollectionViewCell?
    var asset: PHFetchResult<PHAsset>
    
    var photosIndex = [Int](repeating: 0, count: 20)
    var photos = [UIImage?](repeating: nil, count: 20)
    var uploadImage = [UIImage]()
    
    
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
    
    
    // MARK: 콜렉션 뷰
    var num = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellWidth = (UIScreen.main.bounds.width) / 3
    private let kPhotoCell = "PhotoCollectionViewCell"
    
    override func viewDidLoad() {
        print(#function)
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
    
    @IBAction func tapDoneButton(_ sender: Any) {
        
        for i in photos {
            if i != nil{
                uploadImage.append(i!)
            }
        }
        
        delegate?.sendImages(images: uploadImage, number: num)
        dismiss(animated: true)
    }
    
    
    
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
}
extension GallaryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asset.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCell, for: indexPath) as! PhotoCollectionViewCell
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
        let cell = collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        
        if photosIndex[indexPath.row] == 1{
            num -= 1
            cell.number.text = ""
            photos.remove(at: indexPath.row)
            photosIndex[indexPath.row] = 0
            print("\(indexPath.row) 삭제됨")
            print(photos)
        } else {
            num += 1
            cell.number.text = "\(num)"
            photos.insert(cell.imageView.image!, at: indexPath.row)
            photosIndex[indexPath.row] = 1
            print("\(indexPath.row) 추가됨")
            print(photos)
        }
    }
    
}

extension GallaryViewController: PHPhotoLibraryChangeObserver {
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
