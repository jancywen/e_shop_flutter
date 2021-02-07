//
//  MethodChannelManager.swift
//  Runner
//
//  Created by captain on 2021/2/4.
//

import Foundation
import Moya

//
let channelName = "ESHOPCHANNEL"

class MethodChannelManager {
    // 单例
    static let manager = MethodChannelManager()
    private init(){}
    
    
    func methodCallHandler(call: FlutterMethodCall, result:@escaping FlutterResult) {
        guard let type = MethodChannelType(rawValue: call.method) else {
            result(FlutterMethodNotImplemented)
            return
        }
        switch type {
        case .test:
            testChannel(result: result, arguments: call.arguments)
        case .version:
            getVersion(result: result)
        case .homeGoodsList:
            getHomeGoodsList(param: call.arguments, result: result)
        case .homeHotSaleList:
            getHomeHotSaleGoodsList(param: call.arguments, result: result)
        }
    }
    
    // test
    private func testChannel(result: FlutterResult, arguments: Any?) {
        result("test")
    }
    
    /// 获取版本号
    private func getVersion(result: FlutterResult) {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            result(FlutterError(code: "error", message: "无法获取版本号", details: nil))
            return
        }
        result(version)
    }
    
    /// 请求商品列表
    private func getHomeGoodsList(param: Any?, result:@escaping FlutterResult) {
        guard let p = param as? [String: Any] else {
            result(FlutterError(code: "error", message: "入参错误", details: nil))
            return
        }
        Provider.convenience(target: MultiTarget(HomeAPI.goodsList(p))) { res in
            guard let r = res else {
                result(FlutterError(code: "error", message: "请求失败", details: nil))
                return
            }
            result(r)
        }
    }
    
    /// 首页 热销商品
    private func getHomeHotSaleGoodsList(param: Any?, result: @escaping FlutterResult) {
        guard let p = param as? [String: Any] else {
            result(FlutterError(code: "error", message: "入参错误", details: nil))
            return
        }
        Provider.convenience(target: MultiTarget(HomeAPI.hotSaleList(p))) { res in
            guard let r = res else {
                result(FlutterError(code: "error", message: "请求失败", details: nil))
                return
            }
            result(r)
        }
    }
}
