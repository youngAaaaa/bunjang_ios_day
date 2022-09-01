//
//  UpdateProductRequest.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/02.
//

import Foundation

// MARK: - UpdateProductRequest
struct UpdateProductRequest: Codable {
    let productID, storeID: Int
    let name, content: String
    let imageUrls: [String]
    let tags: [String]
    //let price: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case storeID = "storeId"
        case name, content, imageUrls, tags //, price
    }
}
