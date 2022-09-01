//
//  HomeFeedDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/02.
//

import Foundation
import Alamofire
import Kingfisher

final class HomeFeedDataManager {
    
    func getHomeFeedData(page: Int, delegate: MainCollectionViewController) {
        
        let url = URLs.baseURL+URLs.homeURL+"\(page)"
        
        print("url : \(url)")
        
        let header: HTTPHeaders = [
            "X-ACCESS-TOKEN": Constant.jwt!
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: header)
        .validate()
        .responseDecodable(of: HomeFeedResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("🔥‼️홈 피드 정보‼️response.result : \(response.result)🔥")
                }
                else {
                    switch response.code {
                    case 2001: print("JWT를 입력해주세요.")
                    case 2002: print("유효하지 않은 JWT입니다.")
                    case 2003: print("권한이 없는 유저의 접근입니다.")
                    default: print("default")
                    }
                }
            case .failure(let error):
                do{
                    let result = try JSONDecoder().decode(HomeFeedResponse.self, from: response.data!)
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
                print("🔥‼️홈 피드 에러‼️ : \(error.localizedDescription)")
            }
        }
    }
}
