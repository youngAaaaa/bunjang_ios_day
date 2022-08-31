//
//  ReservedResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/30.
//

import Foundation

// MARK: - ReservedResponse
struct ReservedResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ReservedResult]
}

// MARK: - Result
struct ReservedResult: Codable {
    let productId: Int
    let dealStatus, imageUrl01, title: String
    let price: Int
}
