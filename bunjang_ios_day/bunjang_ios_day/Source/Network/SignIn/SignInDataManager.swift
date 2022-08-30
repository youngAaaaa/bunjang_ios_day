//
//  SignInDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/24.
//

import Foundation
import Alamofire

final class SignInDataManager {
    
    // 매개변수(parameters)에 서버로 보낼 정보를 받아서 처리한다.
    func postSignIn(_ parameters: SignInRequest, delegate: RealLoginViewController) {
        
        let url = URLs.baseURL+URLs.signInURL
        
        print("url : \(url)")
        print("parameters :\(parameters)")
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: nil)
        .validate()
        .responseDecodable(of: SignInResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("로그인 성공")
                    print(response)
                    guard let rootVC = delegate.storyboard?.instantiateViewController(withIdentifier: "RootViewController") as? UITabBarController else {
                        return
                    }
                    // 토큰값 유저디폴트에 저장
                    UserDefaults.standard.set(response.result.jwt, forKey: "jwt")
                    UserDefaults.standard.set(response.result.storeId, forKey: "storeId")
                    
                    Constant.isUserLogged = true
                    Constant.jwt = response.result.jwt
                    Constant.storeID = response.result.storeId
                    
                    delegate.changeRootViewController(rootVC)
                }
                else{
                    switch response.code {
                    case 3014: print("없는 번호이거나 비밀번호가 틀렸습니다.")
                    case 2015: print("핸드폰 번호를 입력해주세요.")
                    case 2016: print("핸드폰 번호 형식을 확인해주세요.")
                    default: print("default")
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
