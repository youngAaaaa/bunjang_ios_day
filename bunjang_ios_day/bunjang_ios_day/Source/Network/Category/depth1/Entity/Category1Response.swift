//
//  Category1Response.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import Foundation

// MARK: - Category1Response
struct Category1Response: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Category1]
}

// MARK: - Result
struct Category1: Codable {
    let depth1ID: Int
    let name: String
    let hasMoreDepth: Bool

    enum CodingKeys: String, CodingKey {
        case depth1ID = "depth1Id"
        case name, hasMoreDepth
    }
}
