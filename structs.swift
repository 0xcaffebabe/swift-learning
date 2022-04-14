//
//  structs.swift
//  swift-learning
//
//  Created by mymac on 2022/4/13.
//

import Foundation

struct Location {
    // 这里var跟let的区别在于是否可变
    var x = 0,y: Int = 0
    var z: Int = 0
    
    init() {}
    init(x: Int, y: Int, z: Int) {}
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    // 可失败的构造函数 返回nil
    init?(x: Int) {
        guard x <= 100 else {
            return nil
        }
        self.x = x
    }
    
    // 如果不加mutating这个关键字 这个方法就没法修改结构体
    mutating func setX(x: Int) {
        self.x += 1
    }
    
    func distance() -> Int {
        return x - y
    }
}

var home = Location(x: 1, y: 2, z: 3)
// 如果里面的字段有默认值 在这里的构造可以传参
var empty = Location()
print(Location(x: 4, y: 3))
print(home.x)
print(Location(x:101) ?? -1)
home.x = 2
print(home.distance())

// 结构体和枚举是值类型
var p1 = Location(x: 1, y: 2)
var p2 = p1
p1.x = 3
print(p2.x == 1)
