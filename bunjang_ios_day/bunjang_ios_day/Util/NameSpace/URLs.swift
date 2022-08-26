//
//  URLs.swift
//  bunjang_ios_day
//
//  Created by 안다영 on 2022/08/24.
//

import Foundation

public enum URLs {
    public static let baseURL = "https://prod.choyoonho.site"
    public static let signUpURL = "/bungae/stores/new"
    public static let signInURL = "/bungae/stores/login"
    public static let categoryURL = "/bungae/product/category"
    public static let depth2URL = "/bungae/product/category/{:depth1Id}"
    public static let depth3URL = "/bungae/product/category/{:depth1Id}/{:depth2Id}"
    public static let registrationURL = "/bungae/product/registration"
    
    
}
