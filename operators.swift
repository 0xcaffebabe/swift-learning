//
//  operators.swift
//  swift-learning
//
//  Created by mymac on 2022/4/6.
//

import Foundation

// 基本的数值逻辑运算符操作跟 Java 一样, 但在 Swift3 之后 ++ -- 已被废弃

print(1 / 3)

print(1 < 3)

// 	常量的首次赋值

let i: Int
var condition = false
if condition {
    i = 1
}else {
    i = 2
}

// 区间运算符
let a = 0..<10 // 前闭后开（0-9）
print(a)
// 前闭后闭（1-10）
for index in 1...10 {
    print(index)
    // 循环里的index是常量
    // index += 1
}
