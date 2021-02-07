//
//  HomeAPI.swift
//  Runner
//
//  Created by captain on 2021/2/4.
//

import Foundation
import Moya


fileprivate let goodsListUrl = "/api/home/main-page"
fileprivate let hotSaleUrl = "/api/home/product-info"

enum HomeAPI {
    case goodsList(_ param: [String: Any])
    case hotSaleList(_ param: [String: Any])
}


extension HomeAPI: TargetType {
    
    var path: String {
        switch self {
        case .goodsList:
            return goodsListUrl
        case .hotSaleList: return hotSaleUrl
        }
    }
    
    var task: Task {
        switch self {
        case .goodsList(let p), .hotSaleList(let p):
            return .requestParameters(parameters: p, encoding: URLEncoding.default)
        }
    }
    
    
}
