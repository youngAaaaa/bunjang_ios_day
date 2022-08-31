//
//  RegisteredProductResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/31.
//

import Foundation

// MARK: - RegisteredProductResponse
struct RegisteredProductResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProductResult
}

// MARK: - Result
struct ProductResult: Codable {
    let productID, storeID: Int
    let name: String
    let content: String
    let imageUrls: [String]
    let categoryDepth1ID, categoryDepth2ID, categoryDepth3ID: Int
    let tags: [String]
    let price: Int
    let deliveryFee, change: Bool
    let quantity: Int
    let condition: String?
    let location: String
    
    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case storeID = "storeId"
        case name, content, imageUrls, tags, price, location, condition, quantity, deliveryFee, change
        case categoryDepth1ID = "categoryDepth1Id"
        case categoryDepth2ID = "categoryDepth2Id"
        case categoryDepth3ID = "categoryDepth3Id"
    }
}
