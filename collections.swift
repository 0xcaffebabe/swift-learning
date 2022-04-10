//
//  collections.swift
//  swift-learning
//
//  Created by mymac on 2022/4/10.
//

import Foundation

var dict: [String: String] = ["name": "cxk", "age": "18"]
var dict1: Dictionary<String, String> = [:]

print(dict["name"]!)
print(Array(dict.keys))
print(Array(dict.values))
for key in dict.keys {
    print(dict[key]!)
}
for (key, value) in dict {
    print(key, value)
}
print(dict == ["name": "cxk", "age": "18"])

// 更新
dict["name"] = "jntm"
// 这个方法会返回其之前的值
dict.updateValue("jntm", forKey: "name")
// 删除
dict["name"] = nil
dict.removeValue(forKey: "name")
dict.removeAll()

// 声明
var set : Set<String> = ["a", "b" , "c"]

for i in set {
    print(i)
}
print(set == ["b", "c", "a"])
set.insert("aa")
set.remove("c")
// 集合运算
print(set.union(["a","aa"]))
print(set.intersection(["a", "aa"]))
print(set.subtracting(["a", "aa"]))
print(set.symmetricDifference(["a", "aa"]))
