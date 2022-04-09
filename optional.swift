//
//  optional.swift
//  swift-learning
//
//  Created by mymac on 2022/4/9.
//

import Foundation

var responseCode : Int? = 404
var responseMessage: String? = "success"
// 强制解包
print(responseCode!)
// 在判断中解包
if let responseCode = responseCode {
    // 这里出现了变量遮蔽
    print(responseCode)
}
// 同时判断解包多个
if let responseCode = responseCode,
   let responseMessage = responseMessage {
    print(responseCode, responseMessage)
}

// 可选型链
if let responseMessage = responseMessage {
    print(responseMessage.uppercased)
}
// 等同于
print(responseMessage?.uppercased)

// 如果是 nil 则 message 的值 为 message null
let message = responseMessage ?? "message null"

// 类型转换 如果转换失败 就返回 nil
if let age = Int("18"), age <= 18 {
    print(age)
}

// 隐式可选型
// 一般用在类中 初始化时为空 当初始化完成 保证对外提供的不为 nil
var a: String! = nil
// a = "hello"
// 执行错误
print(a + "dsds")

responseCode = nil
