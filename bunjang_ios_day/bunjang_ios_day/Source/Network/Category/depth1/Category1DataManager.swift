//
//  Category1DataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import Foundation
import Alamofire

final class Category1DataManager {
    
    func getCategory(delegate: SellProductViewController) {
        
        let url = URLs.baseURL+URLs.categoryURL
        
        print("url : \(url)")
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
        .validate()
        .responseDecodable(of: Category1Response.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("‼️카테고리 get 성공‼️")
                    print(response.result)
                    guard let vc = delegate.storyboard?.instantiateViewController(withIdentifier: "Category1ViewController") as? Category1ViewController else { return }
                    vc.item = response.result
                    delegate.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
