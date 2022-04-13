//
//  enums.swift
//  swift-learning
//
//  Created by mymac on 2022/4/13.
//

import Foundation

enum Color: String {
    case Red = "红色",Yellow = "黄色",Blue = "蓝色"
}
let color: Color = .Blue

switch color {
case .Blue:
    print(color.rawValue)
case .Yellow:
    print(color.rawValue)
case .Red:
    print(color.rawValue)
}

// 使用rawValue获取枚举值
print(Color(rawValue: "红色")!)

// 关联值
enum Status {
    case Success(message: String, code: Int)
    case Error(String)
}
let result = Status.Success(message: "done", code: 200)
switch result {
case let .Success(message, _):
    print("sucess \(message)")
case .Error:
    print("error")
}

// 可选型的本质就是使用了关联值的枚举
let name: String? = Optional.some("jntm")
switch name {
case let .some(name):
    print(name)
case .none:
    print("is nil")
}
