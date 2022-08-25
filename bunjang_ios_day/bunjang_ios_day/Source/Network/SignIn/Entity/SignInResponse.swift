//
//  SignInResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import Foundation

// MARK: - SignInResponse
struct SignInResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let storeID: Int
    let jwt: String

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
        case jwt
    }
}
