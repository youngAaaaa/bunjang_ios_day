//
//  Category3Response.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import Foundation

// MARK: - Category3Response
struct Category3Response: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [Category3]
}

// MARK: - Result
struct Category3: Codable {
    let depth3ID: Int
    let name: String
    let hasMoreDepth: Bool

    enum CodingKeys: String, CodingKey {
        case depth3ID = "depth3Id"
        case name, hasMoreDepth
    }
}
