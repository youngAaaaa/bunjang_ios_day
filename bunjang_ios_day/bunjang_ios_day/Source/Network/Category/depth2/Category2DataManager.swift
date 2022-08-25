//
//  Category2DataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import Foundation
import Alamofire

final class Category2DataManager {
    
    func getCategory(_ depth: Int, _ categoryName: String, delegate: Category1ViewController) {
        let depthURL = URLs.depth2URL.replacingOccurrences(of: "{:depth1Id}", with: "\(depth)")
        let url = URLs.baseURL+depthURL
        
        print("url : \(url)")
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
        .validate()
        .responseDecodable(of: Category2Response.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("‼️카테고리 get 성공‼️")
                    print(response.result)
                    
                    guard let vc = delegate.storyboard?.instantiateViewController(withIdentifier: "Category2ViewController") as? Category2ViewController else { return }
                    vc.item = response.result
                    vc.categoryName = categoryName
                    vc.depth1 = depth
                    delegate.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
