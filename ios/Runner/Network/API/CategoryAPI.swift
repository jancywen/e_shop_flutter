//
//  CategoryAPI.swift
//  Runner
//
//  Created by captain on 2021/2/7.
//

import Foundation

import Moya


fileprivate let topListUrl = "/product/category/toplist"
fileprivate let sublistUrl = "/product/category/all-cate"

enum CategoryAPI {
    case topList(_ param: [String: Any])
    case subList(_ param: [String: Any])
}


extension CategoryAPI: TargetType {
    
    var path: String {
        switch self {
        case .topList:
            return topListUrl
        case .subList: return sublistUrl
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .subList:
            return .post
        default:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .topList(let p):
            return .requestParameters(parameters: p, encoding: URLEncoding.default)
        case .subList(let p):
            return .requestParameters(parameters: p, encoding: JSONEncoding.default)
        }
    }
    
}
