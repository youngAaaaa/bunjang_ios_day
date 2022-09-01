//
//  UpdateStoreResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import Foundation

// MARK: - UpdateStoreResponse
struct UpdateStoreResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message, result: String
}
