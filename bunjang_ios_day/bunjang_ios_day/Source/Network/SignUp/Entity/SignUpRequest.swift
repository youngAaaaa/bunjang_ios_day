//
//  SignUpRequest.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/24.
//

import Foundation

struct SignUpRequest: Codable {
    let name: String
    let birth: String
    let gender: String
    let phone: String
    let password: String
}
