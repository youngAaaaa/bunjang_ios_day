//
//  RegisteredProductDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/31.
//

import Foundation
import Alamofire
import ImageSlideshow

final class RegisteredProductDataManager {
    
    func getProductData1(productID: Int, delegate: SalesViewController) {
        let url = URLs.baseURL+URLs.detailProductURL+"\(productID)"
        
        print("url : \(url)")
        
        let header: HTTPHeaders = [
            "X-ACCESS-TOKEN": Constant.jwt!
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: header)
        .validate()
        .responseDecodable(of: RegisteredProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("🔥‼️디테일뷰‼️response.result : \(response.result)")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                    vc.productData = response.result
                    
                    let images = response.result.imageUrls
                    for i in images {
                        vc.imageInputs.append(KingfisherSource(urlString: i)!)
                    }
                    
                    delegate.navigationController?.pushViewController(vc, animated: true)
                } else {
                    switch response.code {
                    case 2001: print("JWT를 입력해주세요.")
                    case 2002: print("유효하지 않은 JWT입니다.")
                    case 2003: print("존재하지 않는 상점 id 입니다.")
                    case 3302: print("해당 사용자가 접근할 수 없는 상품입니다.")
                    default: print("default")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    func getProductData2(productID: Int, delegate: SalesViewController) {
        let url = URLs.baseURL+URLs.detailProductURL+"\(productID)"
        
        print("url : \(url)")
        
        let header: HTTPHeaders = [
            "X-ACCESS-TOKEN": Constant.jwt!
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: header)
        .validate()
        .responseDecodable(of: RegisteredProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("💞상품 수정하기 : \(response.result)💞")
                    let storyboard = UIStoryboard(name: "Registeration", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "SellProductViewController") as! SellProductViewController
                    vc.modalPresentationStyle = .fullScreen
                    vc.tabBarController?.tabBar.isHidden = true
                    vc.receiveName = response.result.name
                    vc.receivePrice = "\(response.result.price)"
                    vc.receiveContent = response.result.content
                    vc.update = true
                    vc.registeredImageNum = response.result.imageUrls.count
                    vc.imageURLs = response.result.imageUrls
                    vc.registeredProduct = response.result
                    
                    delegate.present(vc, animated: true)
                } else {
                    switch response.code {
                    case 2001: print("JWT를 입력해주세요.")
                    case 2002: print("유효하지 않은 JWT입니다.")
                    case 2003: print("존재하지 않는 상점 id 입니다.")
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
