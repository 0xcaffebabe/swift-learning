//
//  array.swift
//  swift-learning
//
//  Created by mymac on 2022/4/10.
//

import Foundation

var nums = [0,1,2,3]

// 指定类型
var strings: [String] = ["0","2", "a"]

// 空数组
var es : Array<String> = []
var es1 = [Int]()

// 5个元素初始值 全为5
var allZeros = [Int](repeating: 5, count: 5)

print(allZeros.count)
print(allZeros.isEmpty)
// 数组越界会有运行异常
print(allZeros[3])
print(allZeros.first!, allZeros.last!)
print(nums.min()!, nums.max()!)

// 子数组 1,2,3
print(nums[1..<4])
print(nums.contains(3))
print(nums.firstIndex(of: 3)!)

// for-each
for number in nums {
    print(number)
}
// 带下标的for-each
for (index, item) in strings.enumerated() {
    print(index, item)
}

// 值比较
print(nums == [0,1,2,3])

es.append("jntm")
// 添加两个元素到数组里面
es += ["cxk", "juki"]
// 插入后位于索引2
es.insert("ctrl", at: 2)
es.removeLast()
es.removeFirst()
// 删除指定下标
es.remove(at: 1)
es.removeAll()

nums[0] = 3
// 区间设置值
nums[0...2] = [9,9,9]
// 两边长度可以不一致
nums[0...2] = [7]

// 可以承载不同数据类型
var na: NSArray = [1, "hello", 3]
