//
//  subscripts.swift
//  swift-learning
//
//  Created by mymac on 2022/4/18.
//

import Foundation

// 自定义运算符需要声明 postfix prefix infix
infix operator |||

struct ReversedList {
    var data: [Int] = [1,2,3,4,5]
    
    // 重载下标运算符
    subscript(index: Int) -> Int? {
        get {
            data[data.count - index - 1]
        }
        set {
            if let newValue = newValue {
                data[data.count - index - 1] = newValue
            }
        }
    }
    // 多维下标
    subscript(index1: Int, index2: Int) -> Int {
        return data[index1] + index2
    }
    
    // 算术运算符重载
    static func + (left: ReversedList, right: ReversedList) -> ReversedList {
        return ReversedList(data: left.data + right.data)
    }
    static func + (left: ReversedList, right: Int) -> ReversedList {
        var left = left
        for i in 0..<left.data.count {
            left.data[i] += right
        }
        return left
    }
    static func += (left: inout ReversedList, right: Int) {
        left = left + right
    }
    prefix static func - (left: ReversedList) -> ReversedList {
        return ReversedList(data: left.data.map {-$0})
    }
    
    // 比较运算符重载
    static func == (left: ReversedList, right: ReversedList) -> Bool {
        guard left.data.count == right.data.count else {
            return false
        }
        for i in 0..<left.data.count {
            if (left.data[i] != right.data[i]) {
                return false
            }
        }
        return true
    }
    static func < (left: ReversedList, right: ReversedList) -> Bool {
        for i in 0..<left.data.count {
            if left.data[i] >= right.data[i] {
                return false
            }
        }
        return true
    }
    
    // 自定义运算符 /,=,-,+,!,*,%,<,>,&,|,^,~
    static func ||| (left: ReversedList, right: ReversedList) -> ReversedList {
        var left = left
        for i in 0..<left.data.count {
            left.data[i] = left.data[i] % right.data[i]
        }
        return left
        
    }
}
var list = ReversedList()
print(list[0]!)
list[0] = 9
print(list[0,9])
print(ReversedList(data:[1,23,3]) + ReversedList(data: [1,2,4]))
print(ReversedList() + 3)
list += 8
print(list)
print(-list)
print(ReversedList(data: [1,2,3]) == ReversedList(data: [1,2,3,1]))

let arr = [ReversedList(data: [4,5,6]), ReversedList(data: [1,2,3])]
print(arr.sorted(by: <))
print(ReversedList(data: [4,5,6]) ||| ReversedList(data: [1,2,3]))
