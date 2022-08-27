//
//  FirebaseStorageManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/27.
//

import UIKit
import FirebaseStorage
import Alamofire

class FirebaseStorageManager {
    static func uploadImage(image: UIImage?, pathRoot: String, completion: @escaping (URL?) -> Void) {
        print("‼️image : \(image!)")
        print("‼️pathRoot : \(pathRoot)")
        
        guard let imageData = image!.jpegData(compressionQuality: 0.9) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        let firebaseReference = Storage.storage().reference().child("\(pathRoot)")
        firebaseReference.putData(imageData, metadata: metaData) { metaData, error in
            if let error = error {
                print(error)
                return
            }
            firebaseReference.downloadURL { url, error in
                if let error = error {
                    print(error)
                    return
                }
                let urlString = url!.absoluteString
                print("download url returned: \(urlString)")
                completion(url)
            }
        }
    }
}
