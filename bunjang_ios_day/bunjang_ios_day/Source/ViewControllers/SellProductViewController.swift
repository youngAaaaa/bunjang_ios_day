//
//  SellProductViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import UIKit
import Photos

class SellProductViewController: UIViewController {
    
    var selectedImage = [UIImage?]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var categoryText: UILabel!
    @IBOutlet weak var categoryText2: UILabel!
    @IBOutlet weak var categoryText3: UILabel!
    
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    @IBAction func tapBackButton(_ sender: Any) {
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
            let gallaryViewController = GallaryViewController()
            gallaryViewController.modalPresentationStyle = .overFullScreen
            gallaryViewController.delegate = self
            self.present(gallaryViewController, animated: true)
        }
    }
    
    @IBAction func tapCategoryButton(_ sender: Any) {
        Category1DataManager().getCategory(delegate: self)
        Constant.category1 = nil
        Constant.category2 = nil
        Constant.category3 = nil
    }
    
    let ms = Date.currentTimeInMilli()
    @IBAction func tapDoneButton(_ sender: UIButton) {
//        for i in selectedImage{
//
//            FirebaseStorageManager.uploadImage(image: i!,
//                                               pathRoot: "day/\(Constant.loginID ?? "")/day_\(ms).jpg"){ [self] url in
//                let urlString = url!.absoluteString
//                let request = RegistrationRequest(name: <#T##String#>,
//                                                  content: <#T##String#>,
//                                                  imageUrls: <#T##[String]#>,
//                                                  categoryDepth1ID: <#T##Int#>,
//                                                  categoryDepth2ID: <#T##Int#>,
//                                                  categoryDepth3ID: <#T##Int#>,
//                                                  tags: <#T##[String]#>,
//                                                  price: <#T##Int#>,
//                                                  deliveryFree: <#T##Bool#>,
//                                                  quantity: <#T##Int#>,
//                                                  condition: <#T##String#>,
//                                                  change: <#T##Bool#>,
//                                                  location: <#T##String#>)
//        RegistrationDataManager().postProduct(request, delegate: self)
//            }
//        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryText2.text = ""
        categoryText3.text = ""
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
    }
    
}

extension SellProductViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return selectedImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        return cell
    }
}

extension SellProductViewController: SelectedImagesDelegate {
    func sendImages(images: [UIImage?], number: Int) {
        print("사진 들어옴")
        selectedImage = images
        print("selectedImage : \(selectedImage)")
    }
}
