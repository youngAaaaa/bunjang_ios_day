//
//  UpdateProductDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/02.
//

import Foundation
import Alamofire

final class UpdateProductDataManager {
    
    // 매개변수(parameters)에 서버로 보낼 정보를 받아서 처리한다.
    func patchProduct(_ parameters: UpdateProductRequest, productId: Int, delegate: SellProductViewController) {
        
        let url = URLs.baseURL+URLs.updateProductURL+"\(productId)"
        
        print("🧡url : \(url)")
        print("🧡parameters :\(parameters)🧡")
        
        let header: HTTPHeaders = [
            "X-ACCESS-TOKEN": Constant.jwt!
        ]
        
        print("🧡header :\(header)🧡")
        
        AF.request(url,
                   method: .patch,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: header)
        .validate()
        .responseDecodable(of: UpdateProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("상품 수정 성공")
                    print("🔥response.result : \(response.result)")
                    delegate.dismiss(animated: true)
                }
                else{
                    switch response.code {
                    case 2001: print("JWT를 입력해주세요.")
                    case 2002: print("유효하지 않은 JWT입니다.")
                    case 3001: print("존재하지 않는 상점 id 입니다.")
                    case 3002: print("해당 사용자가 접근할 수 없는 상품입니다.")
                    case 2311: print("name의 길이가 100자를 초과하였습니다.")
                    case 2313: print("content의 길이가 1000자를 초과하였습니다.")
                    case 2315: print("imageUrl의 수가 10개를 초과하였습니다.")
                    case 2316: print("imageUrl의 0 번째 항목이 500자를 초과하였습니다.")
                    case 2317: print("imageUrl의 1 번째 항목이 500자를 초과하였습니다.")
                    case 2318: print("imageUrl의 2 번째 항목이 500자를 초과하였습니다.")
                    case 2319: print("imageUrl의 3 번째 항목이 500자를 초과하였습니다.")
                    case 2320: print("imageUrl의 4 번째 항목이 500자를 초과하였습니다.")
                    case 2321: print("imageUrl의 5 번째 항목이 500자를 초과하였습니다.")
                    case 2322: print("imageUrl의 6 번째 항목이 500자를 초과하였습니다.")
                    case 2323: print("imageUrl의 7 번째 항목이 500자를 초과하였습니다.")
                    case 2324: print("imageUrl의 8 번째 항목이 500자를 초과하였습니다.")
                    case 2325: print("imageUrl의 9 번째 항목이 500자를 초과하였습니다.")
                    case 2329: print("tag의 수가 5개를 초과하였습니다.")
                    case 2330: print("tag의 글자수가 15자를 초과하였습니다.")
                    case 2334: print("location의 길이가 50자를 초과하였습니다.")
                    case 2336: print("condition은 '새상품' 혹은 '중고상품' 으로 기록해주세요.")
                    case 3330: print("연관되지 않은 depth1Id와 depth2Id입니다.")
                    case 3331: print("더이상 데이터가 존재하지 않는 카테고리 id 입니다.")
                    case 3332: print("잘못된 categoryDepth1Id 입니다.")
                    case 3333: print("잘못된 categoryDepth2Id 입니다.")
                    case 3334: print("연관되지 않은 depth2Id와 depth3Id입니다.")
                    case 4002: print("Validation에 실패하였습니다.")
                    case 4310: print("상품 정보 생성에 실패하였습니다.")
                    case 4311: print("상품 태그 정보 생성에 실패하였습니다.")
                    case 4312: print("상품 이미지 정보 생성에 실패하였습니다.")
                    case 4313: print("상품 location 정보 생성에 실패하였습니다.")
                    default: print("default")
                    }
                }
            case .failure(let error):
                do{
                    let result = try JSONDecoder().decode(UpdateProductResponse.self, from: response.data!)
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
                print("🔥‼️상품 수정 에러‼️ : \(error.localizedDescription)")
            }
            
        }
    }
}

