//
//  SignUpDataManager.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/24.
//

import Alamofire

final class SignUpDataManager {
    
    func postSignUp(_ parameters: SignUpRequest, delegate: SignUpViewController) {
        
        let url = URLs.baseURL+URLs.signUpURL
        
        print("url : \(url)")
        print("parameters :\(parameters)")
        
        
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder(),
                   headers: nil)
        .validate()
        .responseDecodable(of: SignUpResponse.self) { response in
            switch response.result {
            case .success(let response):
                if response.isSuccess {
                    print("회원가입 성공")
                    print(response)
                    //let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    //let vc = storyboard.instantiateViewController(withIdentifier: "RootViewController")
                    
                    // 토큰값 유저디폴트에 저장
                    //                    UserDefaults.standard.set(response.result?.loginId, forKey: "userID")
                    //                    UserDefaults.standard.set(response.result?.jwt, forKey: "jwt")
                    //
                    //                    Constant.isUserLogged = true
                    //                    Constant.jwt = response.result?.jwt
                    //                    Constant.loginID = ConfirmLastViewController.receiveId
                    //
                    //                    print("로그인 아이디 : \(ConfirmLastViewController.receiveId!)")
                    //
                    //                    delegate.changeRootViewController(vc)
                }
                else{
                    switch response.code {
                    case 2014: print("이름을 입력해주세요.")
                    case 2105: print("핸드폰 번호를 입력해주세요.")
                    case 2016: print("핸드폰 번호 형식을 확인 해 주세요.")
                    case 2017: print("이미 등록된 전화번호 입니다.")
                    case 2018: print("생년월일을 입력해 주세요.")
                    case 2019: print("생년월일 형식을 확인해 주세요.")
                    default: print("default")
                    }
                }
                // 네트워킹 실패
            case .failure(let error):
                do{
                    let result = try JSONDecoder().decode(SignUpResponse.self, from: response.data!)
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
                print(error.localizedDescription)
                
            }
        }
    }
}
