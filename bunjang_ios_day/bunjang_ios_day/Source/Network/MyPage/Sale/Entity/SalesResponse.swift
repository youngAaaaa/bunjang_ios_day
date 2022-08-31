//
//  SalesResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/30.
//

import Foundation

// MARK: - SalesResponse
struct SalesResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SalesResult]
}

// MARK: - Result
struct SalesResult: Codable {
    let productId: Int
    let dealStatus: String
    let imageUrl01: String
    let title: String
    let price: Int
}
