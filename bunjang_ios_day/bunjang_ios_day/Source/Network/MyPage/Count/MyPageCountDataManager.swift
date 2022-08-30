//
//  MyPageCountDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/30.
//

import Foundation
import Alamofire

final class MyPageCountDataManager {
    
    func getMyPageCount(storeID: Int, delegate: MyPageViewController) {
        
        let countURL = URLs.myPageURL.replacingOccurrences(of: "{:storeId}", with: "\(storeID)")
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
        .responseDecodable(of: CountResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("🔥‼️마이페이지‼️response.message : \(response.result)")
                    delegate.myPageCount = response.result
                    delegate.collectionView.reloadData()
                } else {
                    switch response.code {
                    case 2001: print("JWT를 입력해주세요.")
                    case 2002: print("유효하지 않은 JWT입니다.")
                    case 2003: print("권한이 없는 유저의 접근입니다.")
                    default: print("default")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }

        }
    }
}
