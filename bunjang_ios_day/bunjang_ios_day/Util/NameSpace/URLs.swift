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
    public static let detailURL = "/bungae/product/registration?productId="
    public static let deleteURL = "/bungae/product/registration/d?productId="
    
    public static let myPageURL = "/bungae/stores/{:storeId}/count"
    public static let saleURL = "/bungae/stores/{:storeId}/sale"
    public static let reservedURL = "/bungae/stores/{:storeId}/reserved"
    public static let closedURL = "/bungae/stores/{:storeId}/closed"
    
}
