//
//  Category2Response.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import Foundation

// MARK: - Category2Response
struct Category2Response: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Category2]
}

// MARK: - Result
struct Category2: Codable {
    let depth2ID: Int
    let name: String
    let hasMoreDepth: Bool

    enum CodingKeys: String, CodingKey {
        case depth2ID = "depth2Id"
        case name, hasMoreDepth
    }
}
