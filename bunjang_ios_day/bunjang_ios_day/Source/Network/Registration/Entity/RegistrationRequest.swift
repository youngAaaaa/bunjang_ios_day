//
//  RegistrationRequest.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/27.
//

import Foundation

// MARK: - RegistrationRequest
struct RegistrationRequest: Codable {
    let name, content: String
    let imageUrls: [String]
    let categoryDepth1ID, categoryDepth2ID, categoryDepth3ID: Int?
    let tags: [String?]
    let price: Int
    let deliveryFree: Bool
    let quantity: Int
    let condition: String
    let change: Bool
    let location: String?

    enum CodingKeys: String, CodingKey {
        case name, content, imageUrls
        case categoryDepth1ID = "categoryDepth1Id"
        case categoryDepth2ID = "categoryDepth2Id"
        case categoryDepth3ID = "categoryDepth3Id"
        case tags, price, deliveryFree, quantity, condition, change, location
    }
}
