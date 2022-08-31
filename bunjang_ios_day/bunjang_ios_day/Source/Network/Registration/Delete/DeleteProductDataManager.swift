//
//  DeleteProductDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import Foundation
import Alamofire

final class DeleteProductDataManager {
    
    // 매개변수(parameters)에 서버로 보낼 정보를 받아서 처리한다.
    func deleteProduct(productID: Int, delegate: SalesViewController) {
        
        let url = URLs.baseURL+URLs.deleteURL+"\(productID)"
        
        print("🧡url : \(url)")
        
        let header: HTTPHeaders = [
            "X-ACCESS-TOKEN": Constant.jwt!
        ]
        
        print("🧡header :\(header)🧡")
        
        AF.request(url,
                   method: .patch,
                   parameters: nil,
                   headers: header)
        .validate()
        .responseDecodable(of: DeleteProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("상품 삭제 성공")
                    print("🔥response.result : \(response.result)")
                    delegate.tableView.reloadData()
                }
                else{
                    switch response.code {
                    case 2001: print("JWT를 입력해주세요.")
                    case 2002: print("유효하지 않은 JWT입니다.")
                    case 3001: print("존재하지 않는 상점 id 입니다.")
                    case 3302: print("해당 사용자가 접근할 수 없는 상품입니다.")
                    default: print("default")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
