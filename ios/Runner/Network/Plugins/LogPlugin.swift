//
//  LogPlugins.swift
//  Runner
//
//  Created by captain on 2021/2/4.
//

import Foundation
import Moya
import SwiftyJSON

/// 日志插件
struct LogPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
            var log = "                                *  *  *  *  *  *"
            log.append("\n")
            log.append("\n")
            log.append("request begin                                ")
            log.append("\n")
            log.append("                                -------------                                ")
            log.append("\n")
            log.append("\n")
            log.append("url: \(target.baseURL.absoluteString + target.path) ")
            log.append("\n")
            
            let task = target.task
            switch task {
            case .requestPlain:
                log.append("para: nil ")
            case .requestParameters(let parameters, let  encoding):
                log.append("                               para: \(parameters) ")
                log.append("\n")
                log.append("                               encoding: \(encoding)")
                log.append("\n")
            default:
                break
            }
            log.append("\n")
            log.append("                               -----------                                ")
            log.append("\n")
            log.append("request end                                ")
            log.append("\n")
            log.append("\n")
            log.append("                                *  *  *  *  *  *")
            log.append("\n")
            print(log)
        }
        
        func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
            var log = "                                *  *  *  *  *  *"
            log.append("\n")
            log.append("\n")
            log.append("response begin                                ")
            log.append("\n")
            log.append("                                -------------                                ")
            log.append("\n")
            log.append("\n")
            log.append("url: \(target.baseURL.absoluteString + target.path) ")
            log.append("\n")
            switch result {
            case .failure(let error):
                
                log.append("\n")
                log.append("                               -----------                                ")
                log.append("\n")
                log.append("response failed with \(error.localizedDescription)                             ")
                log.append("\n")
                log.append("\n")
                log.append("                                *  *  *  *  *  *")
                print(log)
            case .success(let s):
                log.append("\n")
                log.append("                               ---------------                                ")
                log.append("\n")
                log.append("response success with                            ")
                log.append("\n")
                log.append("                               ---------------                                ")
                log.append("\n")
                log.append("                               \(JSON(s.data))                            ")
                log.append("\n")
                log.append("\n")
                log.append("\n")
                log.append("                                *  *  *  *  *  *")
                log.append("\n")
                print(log)
            }
    }
}
