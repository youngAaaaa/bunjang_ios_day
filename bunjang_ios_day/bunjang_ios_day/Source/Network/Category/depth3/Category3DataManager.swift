//
//  Category3DataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import Foundation
import Alamofire

final class Category3DataManager {
    
    func getCategory(_ depth1: Int, _ depth2: Int, _ category1Name: String, _ category2Name: String, delegate: Category2ViewController) {
        let depthURL2 = URLs.depth3URL.replacingOccurrences(of: "{:depth1Id}", with: "\(depth1)")
        print(depthURL2)
        let depthURL3 = depthURL2.replacingOccurrences(of: "{:depth2Id}", with: "\(depth2)")
        print(depthURL3)
        let url = URLs.baseURL+depthURL3
        
        print("url : \(url)")
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
        .validate()
        .responseDecodable(of: Category3Response.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("‼️카테고리 get 성공‼️")
                    print(response.result)
                    
                    guard let vc = delegate.storyboard?.instantiateViewController(withIdentifier: "Category3ViewController") as? Category3ViewController else { return }
                    //vc.delegate = self
                    vc.item = response.result
                    vc.category1Name = category1Name
                    vc.category2Name = category2Name
                    delegate.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
