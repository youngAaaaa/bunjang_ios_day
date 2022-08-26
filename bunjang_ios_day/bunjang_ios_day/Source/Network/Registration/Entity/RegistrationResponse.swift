//
//  RegistrationResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/27.
//

import Foundation

// MARK: - RegistrationResponse
struct RegistrationResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: RegistrationResult
}

// MARK: - Result
struct RegistrationResult: Codable {
    let productID: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name
    }
}
