//
//  CountResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/30.
//

import Foundation

import Foundation

// MARK: - CountResponse
struct CountResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: CountResult
}

// MARK: - Result
struct CountResult: Codable {
    let productCount, basketCount, reviewCount, followerCount: Int
    let followingCount: Int
}
