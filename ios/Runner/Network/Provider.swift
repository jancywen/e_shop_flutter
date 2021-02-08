//
//  Provider.swift
//  Runner
//
//  Created by captain on 2021/2/4.
//

import Foundation
import Moya
import SwiftyJSON

let Provider = MoyaProvider<MultiTarget>(endpointClosure: MoyaProvider.endpointMapping,  plugins: [LogPlugin()])

extension TargetType {
    // 服务器地址
    var baseURL: URL {
        return URL(string: "http://testapi.echainbuy.com:7336")!
    }
    // 请求方式
    var method: Moya.Method {
        return .get
    }
    // 单元测试模拟数据
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    // 验证
    private var validationType: Bool {
        return false
    }
    // 请求头
    var headers: [String: String]? {
        return ["currency": "39", "language": "19", "country": "45"]
    }
    
}

extension MoyaProvider {
    class func endpointMapping(for target: Target) -> Endpoint {
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                        method: target.method,
                        task: target.task.operateTask(),
                        httpHeaderFields: target.headers)
    }
}

extension Task {
    /// 处理加密等
    func operateTask() -> Task {
        return self
    }
}

extension MoyaProvider {
    
    @discardableResult
    open func convenience(target: Target,showHud: Bool = false, completion: @escaping (Any?) -> Void ) -> Cancellable? {
        return request(target) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    if let some = try? response.mapJSON() {
                        completion(some)
                        return
                    }
                }
                completion(nil)
            case .failure(_):
                completion(nil)
            }
        }
    }
        

}
