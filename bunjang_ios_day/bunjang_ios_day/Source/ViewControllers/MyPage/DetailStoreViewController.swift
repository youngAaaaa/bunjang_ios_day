//
//  DetailStoreViewController.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import UIKit
import Photos

class DetailStoreViewController: UIViewController {
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var contentTV: UITextView!
    @IBOutlet weak var profileButton: UIButton!
    
    var selectedImage: UIImage?
    
    var receiveName = ""
    var receiveIntroduce = ""
    
    var imageURL: String?
    
    @IBAction func tapProfileImageButton(_ sender: UIButton) {
        switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
        case .notDetermined:
            print("not determined")
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                switch status {
                case .authorized, .limited:
                    self.presentprofileGalleryViewController()
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
            self.presentprofileGalleryViewController()
        default:
            print("")
        }
    }
    
    func presentprofileGalleryViewController() {
        DispatchQueue.main.async {
            let profileGalleryViewController = ProfileGalleryViewController()
            profileGalleryViewController.modalPresentationStyle = .overFullScreen
            profileGalleryViewController.delegate = self
            self.present(profileGalleryViewController, animated: true)
        }
    }
    
    let ms = Date.currentTimeInMilli()
    @IBAction func tapDoneButton(_ sender: UIButton) {
        FirebaseStorageManager.uploadImage(image: selectedImage!,
                                           pathRoot: "\(Constant.storeID ?? 0)/day_\(ms).jpg"){ [self] url in
            let urlString = url!.absoluteString
            imageURL = urlString
            print("‼️‼️‼️urlString : \(urlString)‼️‼️‼️")
            
            if imageURL != nil {
                let request = UpdateStoreRequest(storeName: titleTF.text!,
                                                 profileImgUrl: imageURL!,
                                                 contactTime: "24시간",
                                                 introduce: contentTV.text!,
                                                 policy: "교환 또는 환불 가능",
                                                 precautions: "시간 약속을 잘 지킵시다!")
                
                UpdateStoreDataManager().updateDetailStoreData(request, storeID: Constant.storeID!, delegate: self)
            }
        }
    }
    
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissKeyboardWhenTappedAround()
        
        titleTF.text = receiveName
        
        contentTV.delegate = self
        
        if receiveIntroduce == "" {
            contentTV.textColor = UIColor.systemGray
            contentTV.text = "상점에 대해 알 수 있도록 연락가능 시간 및 교환/반품/환불 정책과 유의사항등을 입력해주세요"
        } else {
            contentTV.text = receiveIntroduce
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.didDismissGallaryNotification(_:)),
            name: NSNotification.Name("DismissProfileGallaryView"),
            object: nil
        )
        
    }
    
    @objc func didDismissGallaryNotification(_ notification: Notification) {
        DispatchQueue.main.async {
            self.profileButton.setImage(self.selectedImage, for: .normal)
        }
    }

}

extension DetailStoreViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.systemGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 1000{
            textView.deleteBackward()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "상점에 대해 알 수 있도록 연락가능 시간 및 교환/반품/환불 정책과 유의사항등을 입력해주세요"
            textView.textColor = UIColor.systemGray
        }
    }
}


extension DetailStoreViewController: SelectedProfileDelegate {
    func sendImages(images: UIImage) {
        print("사진 들어옴")
        selectedImage = images
        print("selectedImage : \(selectedImage!)")
    }
}
