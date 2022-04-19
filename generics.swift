//
//  generics.swift
//  swift-learning
//
//  Created by mymac on 2022/4/19.
//

import Foundation

// 泛型函数
func swap<T>(a: inout T, b: inout T) {
    (a,b) = (b,a)
}

var a = "123"
var b = "321"
swap(a: &a, b: &b)
print(a,b)

// 泛型类型
struct ArrayList<T> {
    var data: [T] = []
    
    mutating func add(e: T) {
        data += [e]
    }
}

var list = ArrayList<String>()
list.add(e: "123")
print(list)

