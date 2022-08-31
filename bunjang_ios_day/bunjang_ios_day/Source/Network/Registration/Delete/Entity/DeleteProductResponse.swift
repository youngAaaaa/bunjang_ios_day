//
//  DeleteProductResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//


import Foundation

// MARK: - DeleteProductResponse
struct DeleteProductResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: DeleteResult
}

// MARK: - Result
struct DeleteResult: Codable {
    let deletedProductID: Int
    let message: String

    enum CodingKeys: String, CodingKey {
        case deletedProductID = "deletedProductId"
        case message
    }
}
