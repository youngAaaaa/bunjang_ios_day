//
//  SignUpResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/24.
//

import Foundation

// MARK: - SignUpResponse
struct SignUpResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let storeID: Int

    enum CodingKeys: String, CodingKey {
        case storeID = "storeId"
    }
}
