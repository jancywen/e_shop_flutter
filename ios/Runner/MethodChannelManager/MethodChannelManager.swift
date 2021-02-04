//
//  MethodChannelManager.swift
//  Runner
//
//  Created by captain on 2021/2/4.
//

import Foundation

//
let channelName = "ESHOPCHANNEL"

class MethodChannelManager {
    // 单例
    static let manager = MethodChannelManager()
    private init(){}
    
    
    func methodCallHandler(call: FlutterMethodCall, result: FlutterResult) {
        guard let type = MethodChannelType(rawValue: call.method) else {
            result(FlutterMethodNotImplemented)
            return
        }
        switch type {
        case .test:
            testChannel(result: result)
        }
    }
    
    // test
    private func testChannel(result: FlutterResult) {
        result("test")
    }
}
