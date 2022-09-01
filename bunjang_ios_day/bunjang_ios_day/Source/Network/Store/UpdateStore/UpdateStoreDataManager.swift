//
//  UpdateStoreDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import Foundation
import Alamofire
import Kingfisher

final class UpdateStoreDataManager {
    
    func updateDetailStoreData(_ parameters: UpdateStoreRequest, storeID: Int, delegate: DetailStoreViewController) {
        
        let countURL = URLs.updateStoreURL.replacingOccurrences(of: "{:storeId}", with: "\(storeID)")
        let url = URLs.baseURL+countURL
        
        let header: HTTPHeaders = [
            "X-ACCESS-TOKEN": Constant.jwt!,
        ]
        
        print("url : \(url)")
        print("header : \(header)")
        print("🔥‼️상점 정보 수정 parameters : \(parameters)‼️🔥")
        
        
        AF.request(url,
                   method: .patch,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: header)
        .validate()
        .responseDecodable(of: UpdateStoreResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("🔥‼️상점 정보 수정 성공‼️response.result : \(response.result)🔥")
                    delegate.navigationController?.popViewController(animated: true)
                } else {
                    switch response.code {
                    case 2001: print("JWT를 입력해주세요.")
                    case 2002: print("유효하지 않은 JWT입니다.")
                    case 2003: print("권한이 없는 유저의 접근입니다.")
                    default: print("default")
                    }
                }
            case .failure(let error):
                do{
                    let result = try JSONDecoder().decode(UpdateStoreResponse.self, from: response.data!)
                    print("실패 result : \(result)")
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                print("🔥‼️상점 정보 수정 에러‼️ : \(error.localizedDescription)")
            }
            
        }
    }
}

