//
//  MethodChannelEnum.swift
//  Runner
//
//  Created by captain on 2021/2/4.
//

import Foundation

enum MethodChannelType: String {
    case test = "testChannel"
    case version = "getVersion"
    /// home 商品列表
    case homeGoodsList = "homeGoodsList"
    /// home 热售商品
    case homeHotSaleList = "homeHotSaleGoodsList"
    /// 一级类别
    case categoryTopList = "categoryTopList"
    /// 子分类类别
    case categorySublist = "categorySublist"
}
