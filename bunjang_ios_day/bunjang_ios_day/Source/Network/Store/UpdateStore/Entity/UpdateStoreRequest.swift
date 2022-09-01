//
//  UpdateStoreRequest.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/01.
//

import Foundation

// MARK: - UpdateStoreRequest
struct UpdateStoreRequest: Codable {
    let storeName: String
    let profileImgUrl: String
    let contactTime: String
    let introduce: String
    let policy: String
    let precautions: String
}
