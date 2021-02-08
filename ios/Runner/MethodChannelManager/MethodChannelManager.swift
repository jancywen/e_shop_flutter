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
        case .homeGoodsList,
             .homeHotSaleList,
             .categoryTopList,
             .categorySublist:
            normalNetwork(channel: type, param: call.arguments, result: result)
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
    
    private func normalNetwork(channel: MethodChannelType, param: Any?, result: @escaping FlutterResult) {
        guard let p = param as? [String: Any] else {
            result(FlutterError(code: "error", message: "入参错误", details: nil))
            return
        }
        var target: TargetType
        switch channel {
        case .homeGoodsList:
            target = HomeAPI.goodsList(p)
        case .homeHotSaleList:
            target = HomeAPI.hotSaleList(p)
        case .categoryTopList:
            target = CategoryAPI.topList(p)
        case .categorySublist:
            target = CategoryAPI.subList(p)
        default:
            result(FlutterError(code: "error", message: "入参错误", details: nil))
            return
        }
        Provider.convenience(target: MultiTarget(target)) { res in
            guard let r = res else {
                result(FlutterError(code: "error", message: "请求失败", details: nil))
                return
            }
            result(r)
        }
    }
}
