//
//  SellProductViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import UIKit
import Photos
import Kingfisher

class SellProductViewController: UIViewController {
    
    
    var update2 = false
    var update3 = false
    
    var update = false
    var registeredProduct: ProductResult?
    var registeredImageNum: Int?
    var receiveName = ""
    var receivePrice = ""
    var receiveContent = ""
    var recevieTag: [String]?
    
    var selectedImage = [UIImage?]()
    var selectedImageNum: Int?
    var imageURLs = [String]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var categoryText2: UILabel!
    @IBOutlet weak var categoryText3: UILabel!
    
    
    // MARK: 텍스트필드
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameTF: UITextField!
    
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func tapGallary(_ sender: UIButton) {
        switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
        case .notDetermined:
            print("not determined")
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                switch status {
                case .authorized, .limited:
                    self.presentGallaryViewController()
                case .denied:
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }
                    
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)")
                        })
                    }
                default:
                    print("그 밖의 권한이 부여 되었습니다.")
                }
            }
        case .restricted:
            print("restricted")
        case .denied:
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)")
                })
            }
        case .limited, .authorized:
            self.presentGallaryViewController()
        default:
            print("")
        }
    }
    
    func presentGallaryViewController() {
        DispatchQueue.main.async {
            if self.update{
                self.update2 = true
            }
            self.update = false
            let gallaryViewController = GallaryViewController()
            gallaryViewController.modalPresentationStyle = .overFullScreen
            gallaryViewController.delegate = self
            gallaryViewController.delegate = self
            self.present(gallaryViewController, animated: true)
        }
    }
    
    @IBAction func tapCategoryButton(_ sender: Any) {
        Category1DataManager().getCategory(delegate: self)
        Constant.category1 = nil
        Constant.category2 = nil
        Constant.category3 = nil
        
        Constant.category1Name = nil
        Constant.category2Name = nil
        Constant.category3Name = nil
    }
    
    let ms = Date.currentTimeInMilli()
    @IBAction func tapDoneButton(_ sender: UIButton) {
        
        if update2 {
            update3 = true
        } else {
            update3 = false
        }
        
        update = false
        update2 = false
        
        for i in 0..<selectedImageNum! {
            
            FirebaseStorageManager.uploadImage(image: selectedImage[i]!,
                                               pathRoot: "\(Constant.storeID ?? 0)/\(i)_day_\(ms).jpg"){ [self] url in
                let urlString = url!.absoluteString
                imageURLs.append(urlString)
                print("‼️‼️‼️imageURLs : \(imageURLs)‼️‼️‼️")
                
                if !update3{
                    //등록
                    if imageURLs.count == selectedImageNum!{
                        let request = RegistrationRequest(name: nameTF.text!,
                                                          content: textView.text!,
                                                          imageUrls: imageURLs,
                                                          categoryDepth1ID: Constant.category1,
                                                          categoryDepth2ID: Constant.category2,
                                                          categoryDepth3ID: Constant.category3,
                                                          tags: [Constant.category1Name],
                                                          price: Int(priceTF.text!)!,
                                                          deliveryFee: true,
                                                          quantity: 1,
                                                          condition: "중고상품",
                                                          change: false,
                                                          location: "지역 정보 없음")
                        RegistrationDataManager().postProduct(request, delegate: self)
                    }
                }
                else {
                    //수정
                    let end = selectedImageNum! + registeredImageNum!
                    if imageURLs.count == end {
                        let request = UpdateProductRequest(productID: registeredProduct!.productID,
                                                           storeID: registeredProduct!.storeID,
                                                           name: nameTF.text!,
                                                           content: textView.text!,
                                                           imageUrls: imageURLs,
                                                           tags: ["여성의류"]
                                                           )
                                                           //price: Int(priceTF.text!)!)
                        UpdateProductDataManager().patchProduct(request, productId: registeredProduct!.productID, delegate: self)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if update{
            nameTF.text = receiveName
            priceTF.text = receivePrice
            textView.text = receiveContent
        }
        
        categoryText2.text = ""
        categoryText3.text = ""
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.didDismissGallaryNotification(_:)),
            name: NSNotification.Name("DismissGallaryView"),
            object: nil
        )
    }
    
    @objc func didDismissGallaryNotification(_ notification: Notification) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
extension SellProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        if update {
            return registeredImageNum!
        }
        else {
            if update2 {
                return registeredImageNum! + selectedImage.count
            }
            else { return selectedImage.count }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        if update{
            let imageURL = URL(string: imageURLs[indexPath.row])
            cell.imageView.kf.setImage(with: imageURL)
            return cell
        }
        else {
            if update2 {
                if indexPath.row < registeredImageNum!{
                    let imageURL = URL(string: imageURLs[indexPath.row])
                    cell.imageView.kf.setImage(with: imageURL)
                    return cell
                } else {
                    let index = indexPath.row - registeredImageNum!
                    cell.imageView.image = selectedImage[index]
                    cell.number.text = ""
                    return cell
                }
            }
            else {
                cell.imageView.image = selectedImage[indexPath.row]
                cell.number.text = ""
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 70)
    }
}

extension SellProductViewController: SelectedImagesDelegate {
    func sendImages(images: [UIImage?], number: Int) {
        print("사진 들어옴")
        selectedImage = images
        print("selectedImage : \(selectedImage)")
        print("number : \(number)")
        selectedImageNum = number
    }
}
