//
//  HomeFeedResponse.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/09/02.
//

import Foundation

// MARK: - HomeFeedResponse
struct HomeFeedResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    var result: [HomeFeedResult]
}

// MARK: - Result
struct HomeFeedResult: Codable {
    let productID: Int
    let name: String
    let imageURL: String
    let price: Int
    let location, uploaded: String?
    let uploadedEasyText: String
    let dibs: Int
    let dealStatus: String
    let userDibed: Bool

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name
        case imageURL = "imageUrl"
        case price, location, uploaded, uploadedEasyText, dibs, dealStatus, userDibed
    }
}
