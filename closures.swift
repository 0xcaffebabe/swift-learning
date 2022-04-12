//
//  closures.swift
//  swift-learning
//
//  Created by mymac on 2022/4/12.
//

import Foundation

var res = [1, 2, 3].sorted(by: { (a: Int, b: Int) -> Bool in
    return a > b
})
print(res)

// 化简
print([1,2,3].sorted(by: {a, b in a > b}))
// 默认命名
print([1, 2, 3].sorted(by: {$0 > $1}))
// 大于号本身是一个函数
print([1,2,3].sorted(by: >))

// 结尾闭包 最后一个参数是闭包的话 可以使用这种语法
print([1,2,3].sorted{ a, b in a > b})
print([1,2,3].map{v in String(v)})

// 内容捕获
var num = 700
print([1,2,3].sorted{a , b in abs(a-num) < abs(b-num)})
