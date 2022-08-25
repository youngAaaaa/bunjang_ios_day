//
//  SignInRequest.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/25.
//

import Foundation

// MARK: - SignInRequest
struct SignInRequest: Encodable {
    let phone, password: String
}
