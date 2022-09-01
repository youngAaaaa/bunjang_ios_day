//
//  UpdateProductResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/02.
//

import Foundation

// MARK: - UpdateProductResponse
struct UpdateProductResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: UpdateProductResult
}

// MARK: - Result
struct UpdateProductResult: Codable {
    let productID: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name
    }
}
