//
//  HomeService.swift
//  Runner
//
//  Created by captain on 2021/2/4.
//

import Moya

struct HomeServer {
    static func queryGoodsList(param: [String: Any]) {
        Provider.convenience(target: MultiTarget(HomeAPI.goodsList(param))) { response in
        
        }
    }
}
