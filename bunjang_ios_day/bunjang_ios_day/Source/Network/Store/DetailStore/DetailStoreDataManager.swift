//
//  DetailStoreDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import Foundation
import Alamofire
import Kingfisher

final class DetailStoreDataManager {
    
    func getDetailStoreData(storeID: Int, delegate: MyPageViewController) {
        
        let countURL = URLs.detailStoreURL.replacingOccurrences(of: "{:storeId}", with: "\(storeID)")
        let url = URLs.baseURL+countURL
        
        print("url : \(url)")
        
        let header: HTTPHeaders = [
            "X-ACCESS-TOKEN": Constant.jwt!
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: header)
        .validate()
        .responseDecodable(of: DetailStoreResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("🔥‼️상점 정보‼️response.result : \(response.result)🔥")
                    delegate.storeData = response.result
                    
                    if response.result.profileImgURL != nil {
                        let imageURL = URL(string: response.result.profileImgURL!)
                        delegate.profileImage.kf.setImage(with: imageURL)
                    } else {
                        delegate.profileImage.image = UIImage(named: "기본프로필")
                    }
                    
                    delegate.userName.text = response.result.storeName
                    
                } else {
                    switch response.code {
                    case 2001: print("JWT를 입력해주세요.")
                    case 2002: print("유효하지 않은 JWT입니다.")
                    case 2003: print("권한이 없는 유저의 접근입니다.")
                    default: print("default")
                    }
                }
            case .failure(let error):
                print("🔥‼️상정 정보 에러‼️ : \(error.localizedDescription)")
            }
            
        }
    }
}
