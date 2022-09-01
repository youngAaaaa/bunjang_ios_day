//
//  DetailStoreResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import Foundation

// MARK: - DetailStoreResponse
struct DetailStoreResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: DetailStoreResult
}

// MARK: - Result
struct DetailStoreResult: Codable {
    let storeName: String?
    let profileImgURL: String?
    let star: Int?
    let contactTime, introduce, policy, precautions: String?

    enum CodingKeys: String, CodingKey {
        case storeName
        case profileImgURL = "profileImgUrl"
        case star, contactTime, introduce, policy, precautions
    }
}
